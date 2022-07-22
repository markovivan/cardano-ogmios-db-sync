# cardano-ogmios-db-sync
Cardano node docker container with ogmios server and db sync


cardano-ogmios-db-sync




## Cardano-db-sync state snapshots - Mainnet
- snapshot: https://update-cardano-mainnet.iohk.io/cardano-db-sync/index.html#

## Index optimization for block deletions

https://github.com/input-output-hk/cardano-db-sync/issues/975

````
/* From https://www.cybertec-postgresql.com/en/index-your-foreign-key/ */
SELECT c.conrelid::regclass AS "table",
       /* list of key column names in order */
       a.attname as column,
       pg_catalog.pg_size_pretty(
          pg_catalog.pg_relation_size(c.conrelid)
       ) AS size,
       c.conname AS constraint,
       c.confrelid::regclass AS referenced_table,
       'CREATE INDEX ' || c.conrelid::regclass || '_' || a.attname || '_idx ON ' || c.conrelid::regclass || ' (' || a.attname || ');' as fix
FROM pg_catalog.pg_constraint c
   /* enumerated key column numbers per foreign key */
   CROSS JOIN LATERAL
      unnest(c.conkey) WITH ORDINALITY AS x(attnum, n)
   /* name for each key column */
   JOIN pg_catalog.pg_attribute a
      ON a.attnum = x.attnum
         AND a.attrelid = c.conrelid
WHERE NOT EXISTS
        /* is there a matching index for the constraint? */
        (SELECT 1 FROM pg_catalog.pg_index i
         WHERE i.indrelid = c.conrelid
           /* it must not be a partial index */
           AND i.indpred IS NULL
           /* the first index columns must be the same as the
              key columns, but order doesn't matter */
           AND (i.indkey::smallint[])[0:cardinality(c.conkey)-1]
               OPERATOR(pg_catalog.@>) c.conkey)
  AND c.contype = 'f'
GROUP BY c.conrelid, c.conname, c.confrelid, a.attname
ORDER BY pg_catalog.pg_relation_size(c.conrelid) DESC;
````