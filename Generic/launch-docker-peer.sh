source ./set-env $1 $2 $3 $4

export $PEER_SERVICE= "$PEER_NAME.$ORG_NAME"
export $PEER_CONTAINER= "$PEER_NAME.$ORG_NAME.$DOMAIN"
export $PEER_ID =""
export $CHAINCODE_SERVICE= "chaincode$NUM.$ORG_NAME"
export $CHAINCODE_CONTAINER= "chaincode$NUM.$ORG_NAME.$DOMAIN"

export $DB_SERVICE= "couchdb$NUM.$ORG_NAME"
export $DB_CONTAINER="couchdb$NUM.$ORG_NAME.$DOMAIN"


#==== NEED TO EXPOT PORTS HERE =======