#!/bin/bash
source "/bin/bsg.conf"

#dirname = "$0"
echo $1
echo $LOCAL_SERVER_ROOT_PATH

[[ -z "$1" ]] && dirname=$LOCAL_SERVER_ROOT_PATH || dirname=$1

echo "ssh root@$PROD_IP -t cd $dirname && git pull origin master;"

ssh root@$PROD_IP -t "cd $dirname && git pull origin master;"