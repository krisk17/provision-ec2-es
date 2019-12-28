#!bin/bash
# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
# install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
# increase vm max map count sysctl limit
sysctl -w vm.max_map_count=524288
# clone es-cluster project
git clone https://github.com/krisk17/es-cluster
cd es-cluster
# run startup.sh to bring cluster up
bash startup.sh
