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
		echo "CLONING DOCKER: git clone --recursive -j8 $GIT_DOCKER $LOCAL_DOCKER_FOLDER"
		git clone --recursive -j8 $GIT_DOCKER $LOCAL_DOCKER_FOLDER
		echo "ATTEMP TO CREATE VHOSTS"		
		create-sites-available
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
		echo "You must create a bsg.conf on project folder, before install, the add your list of domains and server settings"
		echo "BSG"
		echo "Commands lists:"
		echo "--create-etc-hosts | ceh 			automatic edit /etc/hosts and add your domain list (bsg.conf)"
		echo "--remove-etc-hosts | reh 			remove all your domains (bsg.conf) in /etc/host, restoring it to original version"
		echo "--docker-dev | docker-dev 		create a folder and download your docker repo, build and up -d"
		echo "--create-vhosts | cvh 			create and file for each domain (bsg.conf) point to server root (bsg.conf), in docker folder (for Dockerfile add to apache)"
		echo "--update-symlinks | us 			if you have any symbolic link in server root the scripts update all broken paths"
		echo "--deploy-project | dp 			create a folder and download server git project and submodules"
		echo "--help | h 						help text"
		echo "--cdl          					cd local server root folder"
		echo "--end 							exit aplication"
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
