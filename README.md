# bin-server-git-management-shell-2020

make easy for Francisco Matelli Matulovic to deploy Fnetwork

## Installation

download git repo, edit bsg.conf and ./install.sh

## Usage

Type 'bsg' anywhere in your shell

## Commands

```
Commands lists:
SERVER COMMANDS
--cdl         cd local server root folder
--cdd         cd dev server root folder
--cdh         cd homolog server root folder
--cdp         cd prod server root folder
--sadd        ssh-add id_rsa
		
GIT SHORTHANDS COMMANDS
--gss         git status (gs is ghostscript by default)
--gac         git add --all && git commit ENTER MESSAGE
--gp          git push
--gacd        gac + gp + pull on dev server (if no changes, just pull)
--gach        gac + gp + pull on homolog server (if no changes, just pull)
--gacp        gac + gp + pull on prod server (if no changes, just pull)

MySQL CONNECT COMMANDS
--myl         mysql connect to local default database
--myd         mysql connect to dev default database
--myh         mysql connect to homolog default database
--myp         mysql connect to prod default database

-w | --wizard  : to run a step-by-step wizard
-h | --help    : help text
Don't forget to config it, for detailed instructions see README.md
```
