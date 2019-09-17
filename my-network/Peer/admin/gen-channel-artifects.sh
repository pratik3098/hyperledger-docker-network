# ----- Generating the channel TX ----
CHANNEL_NAME=commercialpaperchannel
CHANNEL_PROFILE=CommercialPaperChannel
CHANNEL_TX=./artefacts/commercialpaper-channel.tx

echo "====> Generating $CHANNEL_NAME <===="
configtxgen -profile $CHANNEL_PROFILE -outputCreateChannelTx $CHANNEL_TX -channelID $CHANNEL_NAME