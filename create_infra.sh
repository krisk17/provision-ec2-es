#!/bin/bash
cmdstatus () {
    if [ $? != 0 ]
    then
        echo "${red} $1 failed${reset}"
        exit 1
    else
        echo "${green} $1 passed${reset}"
    fi
}
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`
# create ssh key
ssh-keygen -b 2048 -t rsa -f mykey -q -N ""
cmdstatus "ssh-keygen mykey"
# create infra
terraform apply -auto-approve -parallelism=50
cmdstatus "create infra"
# ES URL
echo "wait for 2 minutes and try below url, replace ip address from terminal output"
echo "https://<ip>:9200"
echo "username: elastic & password: <get password from https://raw.githubusercontent.com/krisk17/es-cluster/master/.env variable name ELASTIC_PASSWORD>"
echo "If url don't work, do ssh to the instance '''ssh -i mykey ubuntu@<ip>''' and copy paste below command to check for the errors"
echo "tail -f /var/log/cloud-init-output.log"
