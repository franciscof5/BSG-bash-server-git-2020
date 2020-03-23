#!/bin/bash
#Author: Francisco Matelli Matulovic
#GitHub: https://github.com/franciscof5/bin-server-git-management-shell-2020

echo "Bin Server Git Management (bsg)"

conffile="bsg.conf"

if [ -f "$conffile" ]
then
	#echo "$conffile loaded"
	source $conffile
else
	echo "$conffile not found."
	echo "You must create a $conffile file before install, please check README"
fi

#echo "Type command and hit enter/return (help for list)"

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
	--create-sites-available | csa)
		source bsg-scripts/create-sites-available.sh
	;;
	--update-symlinks | us)
		source bsg-scripts/update-mu-folder-symlinks.sh
	;;
	--create-etc-hosts | ceh)
		source bsg-scripts/create-etchosts.sh
	;;
	--remove-etc-hosts | reh)
		source bsg-scripts/remove-bsghosts.sh
	;;
	--docker-dev | docker-dev | dd)
		echo "DEPLOY DEV DOCKER"
		if [ -d "$LOCAL_DOCKER_FOLDER/.git" ]
		then
			echo "$LOCAL_DOCKER_FOLDER is git repo, checking for changes"
			cd $LOCAL_DOCKER_FOLDER
			if [ $(git status | grep modified -c) -ne 0 ] || [ $(git status | grep Untracked -c) -ne 0 ]
			then
				echo "You have untracked changes or files in your docker repo"
				gac
				gp
			fi
		fi
		#echo "checking and installing git, docker and docker-compose..."
		#sudo apt install docker
		echo "CLEANING $LOCAL_DOCKER_FOLDER"
		sudo rm -rf $LOCAL_DOCKER_FOLDER/*
		sudo rm -rf $LOCAL_DOCKER_FOLDER
		sudo mkdir $LOCAL_DOCKER_FOLDER
		sudo chmod 777 -R $LOCAL_DOCKER_FOLDER
		echo "cd $LOCAL_DOCKER_FOLDER"
		cd $LOCAL_DOCKER_FOLDER
		echo "CLONING DOCKER: git clone --recurse-submodules  $GIT_DOCKER $LOCAL_DOCKER_FOLDER"
		git clone --recurse-submodules  $GIT_DOCKER $LOCAL_DOCKER_FOLDER
		echo "ATTEMP TO CREATE VHOSTS"		
		source /bin/create-sites-available
		sudo service docker start
		#docker build .
		sudo docker-compose down
		
		sudo docker-compose build
		sudo docker-compose up -d
	;;

	--apache-dev | apache-dev | ad | da )
		#echo "(todo) checking docker"
		#echo "docker ready and started"
		echo "deleting $LOCAL_SERVER_ROOT"
		sudo rm -rf $LOCAL_SERVER_ROOT
		sudo mkdir $LOCAL_SERVER_ROOT
		sudo chmod 777 -R $LOCAL_SERVER_ROOT
		echo "cd $LOCAL_SERVER_ROOT"
		cd $LOCAL_SERVER_ROOT
		echo "CLONING SERVER ROOT: git clone --recurse-submodules $GIT_SERVER_ROOT $LOCAL_SERVER_ROOT"
		git clone --recurse-submodules $GIT_SERVER_ROOT $LOCAL_SERVER_ROOT
		echo "CREATING MU-PLUGINS SYMLINKS"
		#
		#docker-compose up -d
	;;
	
	--ssh-copy | sc | kc)
		echo "Add SSH to your git service"
		sudo apt install xclip
		cat ~/.ssh/$LOCAL_USER.pub | xclip
		echo "Key is now in yout clipboard, just paste it"
	;;
	--ssh-keygen | --ssh-gen | sg | kg)
		echo "Creating an SSH for user $LOCAL_USER"
		ssh-keygen -t rsa -C "$LOCAL_USER" -f ~/.ssh/$LOCAL_USER
		#The -C option is a comment to help identify the key. The -f option specifies the file name.
		#https://blog.developer.atlassian.com/different-ssh-keys-multiple-bitbucket-accounts/
		echo "Key created, use --sc to copy"
		echo "Create ~/.ssh/config"
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
