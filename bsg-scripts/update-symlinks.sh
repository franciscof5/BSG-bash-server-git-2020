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

PLUGINS_DIR="$LOCAL_SERVER_ROOT/wp-content"
OLD_TARGET="/var/www/composer/vendor/wp/wp-content/plugins"
NEW_TARGET="$LOCAL_SERVER_ROOT/wp-content/plugins"

#find $SRC_DIR -type l \
#  -lname "$OLD_TARGET/*" -printf \
#  'ln -nsf "$(readlink "%p"|sed $SUB)" "$(echo "%p"|sed $SUB)"\n'\
# > script.sh

#cd $PLUGINS_DIR
#find $NEW_TARGET -lname "$OLD_TARGET" \
#    -exec  sh -c 'ln -sf `echo $(readlink $0) | sed $NEW_TARGET` $0' {} \;

DIR=$PLUGINS_DIR
OLD_PATTERN=$OLD_TARGET
NEW_PATTERN=$NEW_TARGET

while read -r line
do
    echo $line
    CUR_LINK_PATH="$(readlink "$line")"
    echo "current: $CUR_LINK_PATH"
    NEW_LINK_PATH="$CUR_LINK_PATH"  
    echo "novo: $NEW_LINK_PATH"
    NEW_LINK_PATH="${NEW_LINK_PATH/"$OLD_PATTERN"/"$NEW_PATTERN"}"
    echo "novo fim: $NEW_LINK_PATH"
    rm "$line"
    ln -s "$NEW_LINK_PATH" "$line"
done <<< $(find "$DIR" -type l)

