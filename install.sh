#!/bin/bash
echo "Bin Server Git Management"
echo "By Francisco Matelli Matulovic"
echo "Made to deploy f5sites fnetwork"

rm -rf /bin/bsg
rm -rf /bin/bsg.conf
cp bsg.sh /bin/bsg
cp bsg.conf /bin/bsg.conf
sudo chmod +x /bin/bsg

#SCRIPTS
rm -rf /bin/cdl
cp bsg-scripts/cdl.sh /bin/cdl
sudo chmod +x /bin/cdl

rm -rf /bin/cdr
cp bsg-scripts/cdr.sh /bin/cdr
sudo chmod +x /bin/cdr

rm -rf /bin/cdr-gp
cp bsg-scripts/cdr-gp.sh /bin/cdr-gp
sudo chmod +x /bin/cdr-gp

rm -rf /bin/gac
cp bsg-scripts/gac.sh /bin/gac
sudo chmod +x /bin/gac

rm -rf /bin/gp
cp bsg-scripts/gp.sh /bin/gp
sudo chmod +x /bin/gp

rm -rf /bin/mld
cp bsg-scripts/mld.sh /bin/mld
sudo chmod +x /bin/mld

rm -rf /bin/create-vhosts
cp bsg-scripts/create-vhosts.sh /bin/create-vhosts
sudo chmod +x /bin/create-vhosts

rm -rf /bin/update-symlinks
cp bsg-scripts/update-symlinks.sh /bin/update-symlinks
sudo chmod +x /bin/update-symlinks

rm -rf /bin/create-etchosts
cp bsg-scripts/create-etchosts.sh /bin/create-etchosts
sudo chmod +x /bin/create-etchosts

rm -rf /bin/create-etchosts-pomo
cp bsg-scripts/create-etchosts-pomo.sh /bin/create-etchosts-pomo
sudo chmod +x /bin/create-etchosts-pomo

rm -rf /bin/remove-bsghosts
cp bsg-scripts/remove-bsghosts.sh /bin/remove-bsghosts
sudo chmod +x /bin/remove-bsghosts

### CREATE SYNC SCRIPTS BASED ON ACTIVE DOMAINS
echo "creat sync scripts based on active domains (bsg.conf)"

#/!bin/bash
echo "db-auto-sync"

conffile="bsg.conf"

if [ -f "$conffile" ]
then
	source $conffile
else
	echo "$conffile not found."
	echo "You must create a $conffile file before install, please check README"
fi

lines='
#AUTO CREATED DB AUTO SYNC-START

echo "Fnetwork database sync (wpsql)"

echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING FNTWORK POSTS e TERMS"
echo -en "\033[0;35m"
wpsql --prefixed 1f
echo -en "\033[0m"


echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING LINKS"
echo -en "\033[0;35m"
wpsql --prefixed 4f
echo -en "\033[0m"

echo "wpsql --prefixed"
'
domains_all=()
for i in "${domains[@]}"
do
	:
	#read all domains and sudomains in config.bsg
	domain_extracted=$(grep -oP '(?<=[.])\w+(?=[.])' <<< $i)
	if [ ${#domain_extracted} -gt 3 ]; then
		#if the trimmed part has more than 3 chars (sometimes get the com at the end)
		domain_trimmed=$(echo $domain_extracted | sed 's/ com//')
		domains_all+=("$domain_trimmed")
	fi
done

eval domains_unique=($(printf "%q\n" "${domains_all[@]}" | sort -u))
for value in "${domains_unique[@]}"
do
    lines="${lines}
	echo -en '\033[0m'
	echo $value
	echo -en '\033[0;35m'
	wpsql --prefixed ${value}_p
	wpsql --prefixed ${value}_t

"
done

imports='
echo "wpsql --import-prefixed"

echo -en "\033[0m"
echo "IMPORTING USERS"
echo -en "\033[0;35m"
wpsql --import-prefixed 2f


echo -en "\033[0m"
echo "IMPORTING COMMENTS"
echo -en "\033[0;35m"
wpsql --import-prefixed 3f


echo -en "\033[0m"
echo "IMPORTING WOO SUBSCRIPTIOS"
echo -en "\033[0;35m"
wpsql --import-prefixed 5f


echo -en "\033[0m"
echo "IMPORTING WOO SHOP_ORDER"
echo -en "\033[0;35m"
wpsql --import-prefixed 6woo


echo -en "\033[0m"
echo "IMPORTING CONTACTS FORMS"
echo -en "\033[0;35m"
wpsql --import-prefixed 7f


echo -en "\033[0m"
echo "IMPORTING CUBE POINTS"
echo -en "\033[0;35m"
wpsql --import-prefixed 8f


echo -en "\033[0m"
echo "IMPORTING POMODOROS POSTS E BP ACTIVITY"
echo -en "\033[0;35m"
wpsql --import-prefixed pomodoros_p
wpsql --import-prefixed pomodoros_t
wpsql --import-prefixed pomodoros_bp_ac'

echo -en "\033[0;35m"

lines="
echo -en '\033[0m'

${lines}

${imports}


#AUTO CREATED DB AUTO SYNC-END"

echo "${lines}"
sudo rm -rf bsg-scripts/db-auto-sync.sh
echo "${lines}" | sudo tee -a bsg-scripts/db-auto-sync.sh

rm -rf /bin/dbs
cp bsg-scripts/db-auto-sync.sh /bin/dbs
sudo chmod +x /bin/dbs

#rm -rf /bin/dbs-posts
#cp bsg-scripts/dbs-posts.sh /bin/dbs-posts
#sudo chmod +x /bin/dbs-posts

echo "Installation successfully. Now you can run 'bsg' command from any directory"
