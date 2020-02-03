#!/bin/bash

echo "Bin Server Git Management (bsg)"
#echo "GitHub: https://github.com/franciscof5/bin-server-git-management-shell-2018"
#echo "Hi, $USER. Current date:" $(date)
#echo "Loading configuration file. Don't forget to manually edit bsg.conf before first usage"

source bsg.conf

if [ "$1" == "" ]; then
	#echo "BSG | Use --help"
	read OPERATION
else 
	OPERATION = $1
fi

case "$OPERATION" in
	--cdl | cdl) 
		echo "cd local server root folder"
		cd $LOCAL_FOLDER && bash
	;;
	
	#-w | --wizard) echo "Wizard" 
	#	source wizard.sh
	#;;
	-h | --help) echo "HELP"
		echo "Commands lists:"
		echo "SERVER COMMANDS"
		echo "--cdl         cd local server root folder"
		echo "--cdd         cd dev server root folder"
		echo "--cdh         cd homolog server root folder"
		echo "--cdp         cd prod server root folder"
		echo "--sadd        ssh-add id_rsa"
		
		echo "GIT SHORTHANDS COMMANDS"
		echo "--gss         git status (gs is ghostscript by default)"
		echo "--gac         git add --all && git commit ENTER MESSAGE"
		echo "--gp          git push"
		echo "--gacd        gac + gp + pull on dev server (if no changes, just pull)"
		echo "--gach        gac + gp + pull on homolog server (if no changes, just pull)"
		echo "--gacp        gac + gp + pull on prod server (if no changes, just pull)"

		echo "MySQL CONNECT COMMANDS"
		echo "--myl         mysql connect to local default database"
		echo "--myd         mysql connect to dev default database"
		echo "--myh         mysql connect to homolog default database"
		echo "--myp         mysql connect to prod default database"

		echo "-w | --wizard  : to run a step-by-step wizard"
		echo "-h | --help    : help text"
		echo "Don't forget to config it, for detailed instructions see README.md"
	;;
esac

source bsg

#TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED
echo "End"
echo "by Francisco Matelli Matulovic | franciscomat.com | f5sites.com"