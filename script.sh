# ----- Part of fabric-ca -----
# ----- Generating the certificates from the crypto confiig file -----
export PATH=${PWD}/../bin:${PWD}:$PATH
export FABRIC_CFG_PATH=${PWD}
export VERBOSE=false
cryptogen generate --config=./crypto-config.yaml

# ----- Generating acnchor peers updatee for peer 1 and peer 2 ------
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP

onfigtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate \
    ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP

# ----- Part of Orderers ------
# ----- Generating channel artifects -----
configtxgen -profile SampleDevModeKafka -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block

# ----- Generating the channel TX ----
configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME


# ----- Part of Peers ------
docker-compose -f $COMPOSE_FILE -f $COMPOSE_FILE_KAFKA -f $COMPOSE_FILE_COUCH up -d 2>&1
      docker ps -a


