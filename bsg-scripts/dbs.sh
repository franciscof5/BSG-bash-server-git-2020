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
echo "EXPORTING LINKS"
echo -en "\033[0;35m"
wpsql --prefixed 4f
echo -en "\033[0m"


echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING CURSOWP"
echo -en "\033[0;35m"
wpsql --prefixed cursowp_p
wpsql --prefixed cursowp_t


echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING SOURCE F5SITES"
echo -en "\033[0;35m"
wpsql --prefixed f5sites_67_p
wpsql --prefixed f5sites_67_t


echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING HORTICAL F5SITES"
echo -en "\033[0;35m"
wpsql --prefixed f5sites_93_p
wpsql --prefixed f5sites_93_t


echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING PORTFOLIO FRANCISCOMAT"
echo -en "\033[0;35m"
wpsql --prefixed franciscomat_2_p
wpsql --prefixed franciscomat_2_t

echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING FRANCISCOMATELLI"
echo -en "\033[0;35m"
wpsql --prefixed franciscomatelli_p
wpsql --prefixed franciscomatelli_t

echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING PENSAMENTOS FRANCISCOMAT"
echo -en "\033[0;35m"
wpsql --prefixed franciscomat_7_p
wpsql --prefixed franciscomat_7_t


echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING LOJASDOMAGO"
echo -en "\033[0;35m"
wpsql --prefixed lojasdomago_p
wpsql --prefixed lojasdomago_t


echo -en "\033[0m"
echo "#####################################"
echo "EXPORTING SACIFOOD"
echo -en "\033[0;35m"
wpsql --prefixed sacifood_p
wpsql --prefixed sacifood_t


echo -en "\033[0m"
echo "*************************************"
echo "IMPORTING USERS"
echo -en "\033[0;35m"
wpsql --import-prefixed 2f


echo -en "\033[0m"
echo "*************************************"
echo "IMPORTING COMMENTS"
echo -en "\033[0;35m"
wpsql --import-prefixed 3f


echo -en "\033[0m"
echo "*************************************"
echo "IMPORTING WOO SUBSCRIPTIOS"
echo -en "\033[0;35m"
wpsql --import-prefixed 5f


echo -en "\033[0m"
echo "*************************************"
echo "IMPORTING WOO SHOP_ORDER"
echo -en "\033[0;35m"
wpsql --import-prefixed 6woo


echo -en "\033[0m"
echo "*************************************"
echo "IMPORTING CONTACTS FORMS"
echo -en "\033[0;35m"
wpsql --import-prefixed 7f


echo -en "\033[0m"
echo "*************************************"
echo "IMPORTING CUBE POINTS"
echo -en "\033[0;35m"
wpsql --import-prefixed 8f


echo -en "\033[0m"
echo "*************************************"
echo "IMPORTING POMODOROS POSTS E BP ACTIVITY"
echo -en "\033[0;35m"
wpsql --import-prefixed pomodoros_p
wpsql --import-prefixed pomodoros_t
wpsql --import-prefixed pomodoros_bp_ac
