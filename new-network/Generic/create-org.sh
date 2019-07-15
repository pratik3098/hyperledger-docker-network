     " ======== Please make sure to run docker.sh before executing this script ========="
     " ======== PLEASE ONLY USE ORDERER IP ADDRESS only  ========"
if [ -z $SUDO_USER ]
then
    echo "===== Script need to be executed with sudo ===="
    echo "Usage: sudo ./create-org.sh org_name orderer_ip_address "
    exit 0
fi

if ! [ -x "$(command -v docker )" ]; then
  echo "Error: docker is not installed."
  echo "Install Docker first"
  exit 0
fi

if [ -z $1 ]
then
    echo "===== Script need to be executed with ORG_NAME and ORDERER ADDRESS===="
    echo "Usage: ./create-org.sh   org_name   orderer_address "
    exit 0
fi

if [ -z $2 ]
then
    echo "===== Please enter ORDERER ADDRESS===="
    echo "Usage: ./create-org.sh   $1   orderer_address "
    exit 0
fi

MSP_ID="$(tr '[:lower:]' '[:upper:]' <<< ${ORG_NAME:0:1})${ORG_NAME:1}"
ORG=${ORG_NAME,,}
ORD=$(echo $2| cut -d'_' -f 1)

export MSP_ID=$MSP_ID"MSP"
export ORG_NAME=$ORG
export ORDERER_ADDRESS=$ORD

echo "============== Setting up ORG_NAME: $ORG_NAME =============="
echo "============== Setting up ORDERER_ADDRESS: $ORDERER_ADDRESS =============="
echo "============== Setting up MSP_ID: $MSP_ID =============="
chmod 755 *
./get-docker-images.sh
cd ./network

#======= Add scripts to generate msp from fabric-ca ================

docker-compose up -d 

#======= Add scripts to add org to network ================
