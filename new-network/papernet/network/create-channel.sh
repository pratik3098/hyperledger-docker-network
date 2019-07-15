set -e
export CHANNEL_TX_FILE=./commercialpaper-channel.tx
# Execute the channel create command
peer channel create -o $ORDERER_ADDRESS -c commercialpaperchannel -f $CHANNEL_TX_FILE


sleep 600000
exit 0


