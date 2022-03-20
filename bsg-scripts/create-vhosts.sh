#/!bin/bash
echo "create-sites-available"
sitesfolder="vhosts"

conffile="/bin/bsg.conf"

if [ -f "$conffile" ]
then
	source $conffile
else
	echo "$conffile not found."
	echo "You must create a $conffile file before install, please check README"
fi

echo "cleaning $LOCAL_DOCKER_FOLDER/$sitesfolder"
sudo rm -rf $LOCAL_DOCKER_FOLDER/$sitesfolder
mkdir $LOCAL_DOCKER_FOLDER/$sitesfolder
echo "Creating vhosts"

for i in "${domains[@]}"; do
	output_no_www="
	<VirtualHost $LOCAL_IP:$LOCAL_PORT $PROD_IP:$PROD_PORT> \n
		ServerName $i \n
		ServerAdmin $SERVERADMINEMAIL  \n
		DocumentRoot $LOCAL_SERVER_ROOT_PATH  \n
		"
		if [ $i = "www.franciscomat.com" ]; then
			output_no_www+="RedirectPermanent / https://www.franciscomatelli.com.br/  \n"
		fi
		if [ $i = "portfolio.franciscomat.com" ]; then
			output_no_www+="RedirectPermanent / https://portfolio.franciscomatelli.com.br/  \n"
		fi
		output_no_www+="
		#ErrorLog /var/log/dockervhost/apache-$i.error.log  \n
	    #CustomLog /var/log/dockervhost/apache-$i.access.log common  \n
	    php_flag log_errors on  \n
	    php_flag display_errors on  \n
	    php_value error_reporting 2147483647  \n
	    php_value error_log /var/log/dockervhost/php-$i.error.log  \n
	</VirtualHost>" 
	echo -e $output_no_www > "$LOCAL_DOCKER_FOLDER/$sitesfolder/$i.conf"
	#echo "$LOCAL_DOCKER_FOLDER/$sitesfolder/$i.conf"
done

echo "Creating SSL vhosts"

for i in "${domains[@]}"; do
	output_with_www="
	<IfModule mod_ssl.c> \n
		<VirtualHost $LOCAL_IP:443 $PROD_IP:443> \n
			ServerName $i \n
			ServerAdmin $SERVERADMINEMAIL \n
			#ServerAlias $i \n
			DocumentRoot $LOCAL_SERVER_ROOT_PATH \n
			"
			if [ $i = "www.franciscomat.com" ]; then
				output_with_www+="RedirectPermanent / https://www.franciscomatelli.com.br/  \n"
			fi
			if [ $i = "portfolio.franciscomat.com" ]; then
				output_with_www+="RedirectPermanent / https://portfolio.franciscomatelli.com.br/  \n"
			fi
			output_with_www+="
			#ErrorLog /var/log/dockervhost/apache-$i.error.log \n
		    #CustomLog /var/log/dockervhost/apache-$i.access.log common \n
		    php_flag log_errors on \n
		    php_flag display_errors on \n
		    php_value error_reporting 2147483647 \n
		    php_value error_log /var/log/dockervhost/php-$i.error.log \n
		    
		Include /etc/letsencrypt/options-ssl-apache.conf \n
		SSLCertificateFile /etc/letsencrypt/live/cursowp.com.br/cert.pem \n
		SSLCertificateKeyFile /etc/letsencrypt/live/cursowp.com.br/privkey.pem \n
		SSLCertificateChainFile /etc/letsencrypt/live/cursowp.com.br/chain.pem \n
		</VirtualHost> \n
	</IfModule>"
echo -e $output_with_www > "$LOCAL_DOCKER_FOLDER/$sitesfolder/$i-le-ssl.conf"
#	echo "$LOCAL_DOCKER_FOLDER/$sitesfolder/$i-le-ssl.conf"
done


