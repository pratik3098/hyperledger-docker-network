AFFILIATION=orderer 
ID_NAME= orderer 
mkdir -p $FABRIC_CA_CLIENT_HOME/ID_NAME
fabric-ca-client register --id.type orderer --id.name $ID_NAME --id.secret pw --id.affiliation $AFFILIATION 

$ORG_NAME=papernet
ID_NAME=admin.papernet
mkdir -p $FABRIC_CA_CLIENT_HOME/ID_NAME
fabric-ca-client register --id.type peer --id.name $ID_NAME --id.secret pw --id.affiliation $ORG_NAME 

ID_NAME=peer0.papernet
mkdir -p $FABRIC_CA_CLIENT_HOME/ID_NAME
fabric-ca-client register --id.type peer --id.name $ID_NAME --id.secret pw --id.affiliation $ORG_NAME

ID_NAME=peer1.papernet
mkdir -p $FABRIC_CA_CLIENT_HOME/ID_NAME
fabric-ca-client register --id.type peer --id.name $ID_NAME --id.secret pw --id.affiliation $ORG_NAME 

ID_NAME=peer2.papernet
mkdir -p $FABRIC_CA_CLIENT_HOME/ID_NAME
fabric-ca-client register --id.type peer --id.name $ID_NAME --id.secret pw --id.affiliation $ORG_NAME 
