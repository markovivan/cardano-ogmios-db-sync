# ARG UBUNTU_VERSION=20.04

# FROM ubuntu:${UBUNTU_VERSION} as ubuntu-nodejs

# ARG NODEJS_MAJOR_VERSION=14
# ENV DEBIAN_FRONTEND=nonintercative
# RUN apt-get update && apt-get install curl -y &&\
#   curl --proto '=https' --tlsv1.2 -sSf -L https://deb.nodesource.com/setup_${NODEJS_MAJOR_VERSION}.x | bash - &&\
#   apt-get install nodejs -y

# WORKDIR /cardano
# COPY configuration /cardano/configuration

# # Mainnet configuation files
# #RUN mkdir -p /configuration/network/mainnet/cardano-node/
# RUN curl https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/mainnet-config.json -o /cardano/configuration/network/mainnet/cardano-node/config.json
# RUN curl https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/mainnet-byron-genesis.json -o /cardano/configuration/network/mainnet/cardano-node/mainnet-byron-genesis.json
# RUN curl https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/mainnet-shelley-genesis.json -o /cardano/configuration/network/mainnet/cardano-node/mainnet-shelley-genesis.json
# RUN curl https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/mainnet-alonzo-genesis.json -o /cardano/configuration/network/mainnet/cardano-node/mainnet-alonzo-genesis.json
# RUN curl https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/mainnet-topology.json -o /cardano//configuration/network/mainnet/cardano-node/topology.json


# # Testnet configuration files
# #RUN mkdir -p /configuration/network/testnet/cardano-node/
# RUN curl https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/testnet-config.json -o /cardano/configuration/network/testnet/cardano-node/config.json
# RUN curl https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/testnet-byron-genesis.json -o /cardano/configuration/network/testnet/cardano-node/testnet-byron-genesis.json
# RUN curl https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/testnet-shelley-genesis.json -o /cardano/configuration/network/testnet/cardano-node/testnet-shelley-genesis.json
# RUN curl https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/testnet-alonzo-genesis.json -o /cardano/configuration/network/testnet/cardano-node/testnet-alonzo-genesis.json
# RUN curl https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/testnet-topology.json -o /cardano/configuration/network/testnet/cardano-node/topology.json


# CMD ["node"]