export FABRIC_CA_HOME=./clients/caclient
export DEFAULT_CLIENT_CONFIG_YAML=./clients/fabric-ca-client-config.yaml

fabric-ca-client enroll -u http://caclient:pw@13.59.68.182:7054
