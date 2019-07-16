if [ -z $1 ]
then
    echo "===== Script need to be executed with ORG_NAME and ORDERER ADDRESS===="
    echo "Usage: ./set-env.sh   org_name   orderer_address "
    exit 0
else 
   ORG=$1
   export MSP_ID="$(tr '[:lower:]' '[:upper:]' <<< ${ORG:0:1})${ORG:1}"
   ORG=${ORG,,}
   export $ORG_NAME=ORG
fi

if [ -z $2 ]
then
    echo "===== Please enter Identity===="
    echo "Usage: ./set-env.sh   $ORG   PEER_IDENTITY    ORDERER_ADDRESS   DOMAIN "
    exit 0
else
   ID= $(echo "$2" | tr '[:upper:]' '[:lower:]')
   if [$ID == "admin"]
   then
   export PEER_NAME=$ID
   export NUM=$ID
   export PEER_ID="$ID.$ORG_NAME"
   else if [ ($(printf '%s' "$ID" | sed 's/[0-9]//g') == "peer" ) -a !( -z $(echo "$ID" | tr -dc '0-9')) ]
    then 
    export PEER_ID="$ID.$ORG_NAME"
    export PEER_IDENTITY=$ID
    export NUM=$(echo "$ID" | tr -dc '0-9')
   fi
fi




if [ -z $3 ]
then
    echo "===== Warning: ORDERER_ADDRESS NOT PROVIDED ===="
    if [-z $ORDERER_ADDRESS]
    then
    echo "===== Error: ORDERER_ADDRESS Empty ===="
    echo "Usage: ./set-env.sh   $ORG   PEER_IDENTITY    ORDERER_ADDRESS   DOMAIN "
    exit 0
    fi
else 
   ORD=$(echo $3| cut -d':' -f 1)
   export ORDERER_ADDRESS=$ORD
fi


if [-z $4]
then  
   echo "===== Warning: DOMAIN_ADDRESS NOT PROVIDED ===="
   echo "===== Setting default domain: hyperfabrics.com ===="
   export $DOMAIN="hyperfabrics.com"
else
   export $DOMAIN=ID=$(echo "$4" | tr '[:upper:]' '[:lower:]')
fi

if ! [ -x "$(command -v docker )" ]; then
  echo "Error: docker is not installed."
  exit 0
fi