#!/bin/bash
#Author: Francisco Matelli Matulovic
#GitHub: https://github.com/franciscof5/bin-server-git-management-shell-2020

echo "Bin Server Git Management (bsg)"

conffile="/bin/bsg.conf"

if [ -f "$conffile" ]
then
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
	--create-etc-hosts | ceh)
		remove-bsghosts
		create-etchosts
	;;
	--create-etc-hosts-pomo | ceh-pomo)
		remove-bsghosts
		create-etchosts-pomo
	;;
	--remove-etc-hosts | reh)
		remove-bsghosts
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
		echo "CREATE VHOSTS"
		create-vhosts
		echo "CLONING DOCKER: git clone --recursive -j8 $GIT_DOCKER $LOCAL_DOCKER_FOLDER"
		git clone --recursive -j8 $GIT_DOCKER $LOCAL_DOCKER_FOLDER
		echo "ATTEMP TO CREATE VHOSTS"		
		sudo service docker start
		#docker build .
		sudo docker-compose down
		
		sudo docker-compose build
		sudo docker-compose up -d
	;;
	--create-vhosts | cvh)
		create-vhosts
	;;
	--update-symlinks | us)
		update-mu-folder-symlinks
	;;
	--cdl | cdl) 
		echo "cd local server root folder"
		cd $LOCAL_FOLDER && bash
	;;

	--deploy-project | dp )
		#todo: check docker ready and started"
		echo "deleting $LOCAL_SERVER_ROOT_PATH"
		sudo rm -rf $LOCAL_SERVER_ROOT_PATH
		sudo mkdir $LOCAL_SERVER_ROOT_PATH
		#todo: remove 777
		sudo chmod 777 -R $LOCAL_SERVER_ROOT_PATH
		echo "cd $LOCAL_SERVER_ROOT_PATH"
		cd $LOCAL_SERVER_ROOT_PATH
		echo "CLONING SERVER ROOT: git clone --recursive -j8 $GIT_SERVER_ROOT $LOCAL_SERVER_ROOT_PATH"
		git clone --recursive -j8 $GIT_SERVER_ROOT $LOCAL_SERVER_ROOT_PATH
		git submodule update --force --recursive --init --remote
		echo "UPDATING MU-PLUGINS SYMLINKS"
		update-mu-folder-symlinks
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
	-w | wizard) 
		echo "Wizard (not ready yet)" 
	;;
	-h | --help | help) 
		echo "HELP"
		echo -en "\033[0;35m"
		echo "You must create a bsg.conf on project folder, before install, the add your list of domains and server settings"
		echo -en "\033[0m"
		echo ""
		echo "BSG COMMAND LIST"
		echo "--create-etc-hosts | ceh"
		echo -en "\033[0;35m"
		echo "automatic edit /etc/hosts and add your domain list (bsg.conf)"
		echo ""
		echo -en "\033[0m"
		echo "--remove-etc-hosts | reh"
		echo -en "\033[0;35m"
		echo "remove all your domains (bsg.conf) in /etc/host, restoring it to original version"
		echo ""
		echo -en "\033[0m"
		echo "--docker-dev | docker-dev"
		echo -en "\033[0;35m"
		echo "create a folder and download your docker repo, build and up -d"
		echo ""
		echo -en "\033[0m"
		echo "--create-vhosts | cvh"
		echo -en "\033[0;35m"
		echo "create and file for each domain (bsg.conf) point to server root (bsg.conf), in docker folder (for Dockerfile add to apache)"
		echo ""
		echo -en "\033[0m"
		echo "--update-symlinks | us"
		echo -en "\033[0;35m"
		echo "if you have any symbolic link in server root the scripts update all broken paths"
		echo ""
		echo -en "\033[0m"
		echo "--deploy-project | dp"
		echo -en "\033[0;35m"
		echo "create a folder and download server git project and submodules"
		echo ""
		echo -en "\033[0m"
		echo "--help | h"
		echo -en "\033[0;35m"
		echo "help text"
		echo ""
		echo -en "\033[0m"
		echo "--cdl"
		echo -en "\033[0;35m"
		echo "cd local server root folder"
		echo ""
		echo -en "\033[0m"
		echo "--end"
		echo -en "\033[0;35m"
		echo "exit aplication"
		echo "Don't forget to config it, for detailed instructions see README.md"
	;;
	end)
		echo "Bye"
		exit		
	;;
esac

#TEMP INSTALL ALWAYS
#source install.sh
source bsg

#TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED
echo "End"
echo "by Francisco Matelli Matulovic | franciscomat.com | f5sites.com"
