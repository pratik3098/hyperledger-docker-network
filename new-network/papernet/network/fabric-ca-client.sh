ORG_NAME=papernet
ID_NAME=admin.papernet
mkdir -p $FABRIC_CA_CLIENT_HOME/$ID_NAME
fabric-ca-client register --id.type peer --id.name $ID_NAME --id.secret pw --id.affiliation $ORG_NAME 


#fabric-ca-client enroll -u http://$ID_NAME:pw@13.59.68.182:7054

sleep 3
#ID_NAME=peer0.papernet
#mkdir -p $FABRIC_CA_CLIENT_HOME/$ID_NAME
#fabric-ca-client register --id.type peer --id.name $ID_NAME --id.secret pw --id.affiliation $ORG_NAME

#ID_NAME=peer1.papernet
#mkdir -p $FABRIC_CA_CLIENT_HOME/$ID_NAME
#fabric-ca-client register --id.type peer --id.name $ID_NAME --id.secret pw --id.affiliation $ORG_NAME 

#ID_NAME=peer2.papernet
#mkdir -p $FABRIC_CA_CLIENT_HOME/$ID_NAME
#fabric-ca-client register --id.type peer --id.name $ID_NAME --id.secret pw --id.affiliation $ORG_NAME 
