mkdir -p ./artefacts
# ----- Generating channel artifects -----
CHANNEL_NAME=ordererchannel
CHANNEL_PROFILE_NAME=CommercialPaperOrdererGenesis
GENESIS_BLOCK=./artefacts/commercialpaper-genesis.block

echo "====> Generating $CHANNEL_NAME <==== "
configtxgen -profile $CHANNEL_PROFILE_NAME -channelID $CHANNEL_NAME -outputBlock $GENESISBLOCK


