#/!bin/bash
echo "update-symlinks.sh"
sitesfolder="mu-plugins"

conffile="bsg.conf"

if [ -f "$conffile" ]
then
	#echo "$conffile loaded"
	source $conffile
else
	echo "$conffile not found."
	echo "You must create a $conffile file before install, please check README"
fi

PLUGINS_DIR="$LOCAL_SERVER_ROOT/wp-content/mu-plugins-all-domains"
OLD_TARGET="/var/www/composer/vendor/wp/wp-content/plugins/*"
NEW_TARGET="$LOCAL_SERVER_ROOT/wp-content/plugins"

#find $SRC_DIR -type l \
#  -lname "$OLD_TARGET/*" -printf \
#  'ln -nsf "$(readlink "%p"|sed $SUB)" "$(echo "%p"|sed $SUB)"\n'\
# > script.sh

find $PLUGINS_DIR -lname "$OLD_TARGET" \
    -exec  sh -c 'ln -sf `echo $(readlink $0) | sed $NEW_TARGET` $0' {} \;
