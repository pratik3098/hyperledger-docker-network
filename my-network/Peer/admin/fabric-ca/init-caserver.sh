killall fabric-ca-server
rm -rf $FABRIC_CA_SERVER_HOME/msp 2> /dev/null
rm $FABRIC_CA_SERVER_HOME/* 2> /dev/null
rm -rf $FABRIC_CA_CLIENT_HOME/* 2> /dev/null