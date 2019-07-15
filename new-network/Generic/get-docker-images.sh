#!/bin/bash -eu
# set the default Docker namespace and tag
export DOCKER_NS=hyperledger
#ARCH=amd64
export VERSION=1.4.1
export BASE_DOCKER_TAG=0.4.15
export NODEENV_TAG=2.0
# set of Hyperledger Fabric images
FABRIC_IMAGES=(fabric-peer fabric-tools fabric-ca)

for image in ${FABRIC_IMAGES[@]}; do
  echo "Pulling ${DOCKER_NS}/$image:s${VERSION}"
  docker pull ${DOCKER_NS}/$image:${VERSION}
done

docker pull hyperledger/fabric-nodeenv:${NODEENV_TAG}

THIRDPARTY_IMAGES=(fabric-couchdb)

for image in ${THIRDPARTY_IMAGES[@]}; do
  echo "Pulling ${DOCKER_NS}/$image:${BASE_DOCKER_TAG}"
  docker pull ${DOCKER_NS}/$image:${BASE_DOCKER_TAG}
done
