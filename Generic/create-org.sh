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
    echo "Usage: ./create-org.sh   ORG_NAME   ORDERER_ADDRESS   DOMAIN "
    exit 0
else 
   ORG=$1
   export MSP_ID="$(tr '[:lower:]' '[:upper:]' <<< ${ORG:0:1})${ORG:1}"
   ORG=${ORG,,}
   export $ORG_NAME=ORG
fi

if [ -z $2 ]
then
    echo "===== Error: ORDERER_ADDRESS empty ===="
    echo "Usage: ./create-org.sh   $ORG   ORDERER_ADDRESS   DOMAIN "
    exit 0
else 
   ORD=$(echo $2| cut -d':' -f 1)
   export ORDERER_ADDRESS=$ORD
fi

if [-z $3]
then  
   echo "===== Warning: DOMAIN_ADDRESS not provided ===="
   echo "===== Setting default domain: hyperfabrics.com ===="
   export $DOMAIN="hyperfabrics.com"
else
   export $DOMAIN=ID=$(echo "$3" | tr '[:upper:]' '[:lower:]')
fi


echo "============== Setting up ORG_NAME: $ORG_NAME =============="
echo "============== Setting up ORDERER_ADDRESS: $ORDERER_ADDRESS =============="
echo "============== Setting up MSP_ID: $MSP_ID =============="
echo "============== Setting up DOMAIN: $DOMAIN =============="
chmod 755 *
./get-docker-images.sh
cd ./network

#======= Add scripts to generate msp from fabric-ca ================

docker-compose up -d 

#======= Add scripts to add org to network ================
