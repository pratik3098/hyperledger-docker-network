
fabric-ca-server init -n ca.papernet.hyperfabrics.com 2> ./init-ca.log
fabric-ca-server start -b caclient:pw -n caclient.papernet.hyperfabrics.com 2> ./ca-server.log 



#fabric-ca-server start -n ca.papernet.hyperfabrics.com 2> ./ca-server.log
