#1  launching the peer and writing the log to peer.log
peer node start 2> ./$CORE_PEER_ID.log  &

sleep 10 
#2 Checking the peer status
peer node status

#3 Fetch the genesis for the channel - this leads to creation of commercialpaperchannel
peer channel fetch 0  -o $ORDERER_ADDRESS -c commercialpaperchannel

#4 Joing the channel
peer channel join -b $COMMERCIALPAPER_CHANNEL_BLOCK_0 -o $ORDERER_ADDRESS