
#fabric-ca-server init -b ca.papernet.hyperfabrics.com 2> ./init-ca.log
fabric-ca-server init -b caclient.papernet.hyperfabrics.com:pw -n ca.papernet.hyperfabrics.com 2> ./ca-server.log 

fabric-ca-server start -n ca.papernet.hyperfabrics.com &



#fabric-ca-server start -n ca.papernet.hyperfabrics.com 2> ./ca-server.log
