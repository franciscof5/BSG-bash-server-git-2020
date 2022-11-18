echo -en "\033[0m"
echo "#####################################"
echo "SYNC UPLOADS"
echo -en "\033[0;35m"
cd "/var/www/html/wp-content/uploads" && git add --all  && git commit -m "DBS a$
echo -en "\033[0m"
