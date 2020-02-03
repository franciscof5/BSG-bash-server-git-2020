#!/bin/bash
#MERGE LOCAL TO HOMOLOG
source "/bin/bsg.conf"
dirname "$0"

git checkout $LOCAL_BRANCH
gac
gp
echo "### CHECKING DEV: $DEV_BRANCH"
git checkout $DEV_BRANCH
git pull origin $DEV_BRANCH
echo "### MERGING LOCAL TO DEV: $LOCAL_BRANCH to $DEV_BRANCH"
git merge $LOCAL_BRANCH
git push origin $DEV_BRANCH
echo "### RETURNING TO BRANCH $LOCAL_BRANCH"
git checkout $LOCAL_BRANCH