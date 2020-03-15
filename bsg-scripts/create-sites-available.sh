#/!bin/bash
echo "create-sites-available.sh"
sitesfolder="csa"

#printf "%s\n" "${domains[@]}"

echo "cleaning $LOCAL_DOCKER_FOLDER/$sitesfolder"
sudo rm -rf $LOCAL_DOCKER_FOLDER/$sitesfolder
mkdir $LOCAL_DOCKER_FOLDER/$sitesfolder
echo "Creating default config files for each domain"

for i in "${domains[@]}"
do
	:	
	echo "
<VirtualHost $LOCAL_IP:$LOCAL_PORT $PROD_IP:$PROD_PORT>
	ServerName $i
	ServerAdmin $SERVERADMINEMAIL
	ServerAlias www.$i
	DocumentRoot $LOCAL_SERVER_ROOT
</VirtualHost>
" > $LOCAL_DOCKER_FOLDER/$sitesfolder/$i
	echo $i
done
