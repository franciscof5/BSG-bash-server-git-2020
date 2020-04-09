#!/bin/bash
source "/bin/bsg.conf"
dirname "$0"
ssh root@$PROD_IP -t "cd $LOCAL_SERVER_ROOT_PATH; bash --login"