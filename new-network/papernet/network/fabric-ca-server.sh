fabric-ca-server init -b admin:adminpw -n ca.papernet.hyperfabrics.com 

fabric-ca-server start -n ca.papernet.hyperfabrics.com 2> ./ca-server.log
