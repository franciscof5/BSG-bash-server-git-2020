#/!bin/bash
echo "create-sites-available.sh"
sitesfolder="csa"

#printf "%s\n" "${domains[@]}"

echo "cleaning $LOCAL_DOCKER_FOLDER/$sitesfolder"
sudo rm -rf $LOCAL_DOCKER_FOLDER/$sitesfolder
mkdir $LOCAL_DOCKER_FOLDER/$sitesfolder
echo "Creating vhosts"

for i in "${domains[@]}"
do
	:	
	echo "<VirtualHost $LOCAL_IP:$LOCAL_PORT $PROD_IP:$PROD_PORT>
	ServerName $i
	ServerAdmin $SERVERADMINEMAIL
	ServerAlias www.$i
	DocumentRoot $LOCAL_SERVER_ROOT
</VirtualHost>
" > "$LOCAL_DOCKER_FOLDER/$sitesfolder/$i.conf"
	echo "$LOCAL_DOCKER_FOLDER/$sitesfolder/$i.conf"
done

echo "Creating SSL vhosts"

for i in "${domains[@]}"
do
	:	
	echo "<IfModule mod_ssl.c>
<VirtualHost $LOCAL_IP:443 $PROD_IP:443>
	ServerName $i
	ServerAdmin $SERVERADMINEMAIL
	ServerAlias *.$i www.$i
	DocumentRoot $LOCAL_SERVER_ROOT
Include /etc/letsencrypt/options-ssl-apache.conf
SSLCertificateFile /etc/letsencrypt/live/cursowp.com.br/cert.pem
SSLCertificateKeyFile /etc/letsencrypt/live/cursowp.com.br/privkey.pem
SSLCertificateChainFile /etc/letsencrypt/live/cursowp.com.br/chain.pem
</VirtualHost>
</IfModule>
" > "$LOCAL_DOCKER_FOLDER/$sitesfolder/$i-le-ssl.conf"
	echo "$LOCAL_DOCKER_FOLDER/$sitesfolder/$i-le-ssl.conf"
done


