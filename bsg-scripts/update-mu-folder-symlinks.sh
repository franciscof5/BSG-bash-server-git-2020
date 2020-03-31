#/!bin/bash
echo "update-mu-folder-symlinks"
sitesfolder="mu-plugins"

conffile="/bin/bsg.conf"

if [ -f "$conffile" ]
then
	#echo "$conffile loaded"
	source $conffile
else
	echo "$conffile not found."
	echo "You must create a $conffile file before install, please check README"
fi

DIR="$LOCAL_SERVER_ROOT_PATH/wp-content"
OLD_PATTERN="/var/www/composer/vendor/wp/wp-content/plugins"
NEW_PATTERN="$LOCAL_SERVER_ROOT_PATH/wp-content/plugins"

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

#################


DIR2="$LOCAL_SERVER_ROOT_PATH/wp-content"
OLD_PATTERN2="/var/www/composer/vendor/wp/wp-content"
NEW_PATTERN2="$LOCAL_SERVER_ROOT_PATH/wp-content"

while read -r line
do
    echo $line
    CUR_LINK_PATH="$(readlink "$line")"
    echo "current: $CUR_LINK_PATH"
    NEW_LINK_PATH="$CUR_LINK_PATH"  
    echo "novo: $NEW_LINK_PATH"
    NEW_LINK_PATH="${NEW_LINK_PATH/"$OLD_PATTERN2"/"$NEW_PATTERN2"}"
    echo "novo fim: $NEW_LINK_PATH"
    rm "$line"
    ln -s "$NEW_LINK_PATH" "$line"
done <<< $(find "$DIR2" -type l)

