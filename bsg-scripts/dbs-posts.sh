#!/bin/bash
echo "Fnetwork database sync (wpsql)"
source "/bin/bsg.conf"


echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING FNTWORK POSTS e TERMS"
echo -en "\033[0;35m"
wpsql --prefixed 1f
echo -en "\033[0m"

echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING FRANCISCOMATELLI"
echo -en "\033[0;35m"
wpsql --prefixed franciscomatelli_p
wpsql --prefixed franciscomatelli_t

echo -en "\033[0m"
echo "#####################################"
echo "SYNC UPLOADS"
echo -en "\033[0;35m"
cd "/var/www/html/wp-content/uploads" && git add --all  && git commit -m "DBS auto sync" && git push origin master && cdr-gp "/var/www/html/wp-content/uploads"
echo -en "\033[0m"
