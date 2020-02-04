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

	--docker-dev | docker-dev | d)
		echo "checking and installing git, docker and docker-compose..."
		#sudo apt install docker
		echo "cleaning $DOCKER_FOLDER"
		sudo rm -rf $DOCKER_FOLDER
		sudo mkdir $DOCKER_FOLDER
		sudo chmod 777 -R $DOCKER_FOLDER
		echo "cd $DOCKER_FOLDER"
		cd $DOCKER_FOLDERR
		echo "cloning deployer..."
		git clone --recurse-submodules git@bitbucket.org:f5sites/fnetwork-deployer-1-linode.git $DOCKER_FOLDER
		echo "uping server"...
		#docker-compose up -d
	;;
	
	--ssh-copy | sc)
		echo "Add SSH to your git service"
		sudo apt install xclip
		cat ~/.ssh/id_rsa.pub | xclip
		echo "Key is now in yout clipboard, just paste it"
	;;

	#-w | --wizard) echo "Wizard" 
	#	source wizard.sh
	#;;
	-h | --help | help) echo "HELP"
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

		echo "DOCKER/DEPLOY COMMANDS"
		echo "Dowload deployer..."
		echo "Install on root..."


		echo "-w | --wizard  : to run a step-by-step wizard"
		echo "-h | --help    : help text"
		echo "Don't forget to config it, for detailed instructions see README.md"
	;;
esac

#TEMP INSTALL ALWAYS
#source install.sh
source bsg

#TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED
echo "End"
echo "by Francisco Matelli Matulovic | franciscomat.com | f5sites.com"