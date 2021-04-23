
echo -en '\033[0m'


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

	echo -en '\033[0m'
	echo coworkinghostel
	echo -en '\033[0;35m'
	wpsql --prefixed coworkinghostel_p
	wpsql --prefixed coworkinghostel_t


	echo -en '\033[0m'
	echo cursowp
	echo -en '\033[0;35m'
	wpsql --prefixed cursowp_p
	wpsql --prefixed cursowp_t


	echo -en '\033[0m'
	echo f5sites
	echo -en '\033[0;35m'
	wpsql --prefixed f5sites_p
	wpsql --prefixed f5sites_t


	echo -en '\033[0m'
	echo focalizador
	echo -en '\033[0;35m'
	wpsql --prefixed focalizador_p
	wpsql --prefixed focalizador_t


	echo -en '\033[0m'
	echo franciscomat
	echo -en '\033[0;35m'
	wpsql --prefixed franciscomat_p
	wpsql --prefixed franciscomat_t


	echo -en '\033[0m'
	echo franciscomatelli
	echo -en '\033[0;35m'
	wpsql --prefixed franciscomatelli_p
	wpsql --prefixed franciscomatelli_t


	echo -en '\033[0m'
	echo hostelmargaridas
	echo -en '\033[0;35m'
	wpsql --prefixed hostelmargaridas_p
	wpsql --prefixed hostelmargaridas_t


	echo -en '\033[0m'
	echo lanofrancisco
	echo -en '\033[0;35m'
	wpsql --prefixed lanofrancisco_p
	wpsql --prefixed lanofrancisco_t


	echo -en '\033[0m'
	echo lojasdomago
	echo -en '\033[0;35m'
	wpsql --prefixed lojasdomago_p
	wpsql --prefixed lojasdomago_t


	echo -en '\033[0m'
	echo pomodoros
	echo -en '\033[0;35m'
	wpsql --prefixed pomodoros_p
	wpsql --prefixed pomodoros_t


	echo -en '\033[0m'
	echo projectimer
	echo -en '\033[0;35m'
	wpsql --prefixed projectimer_p
	wpsql --prefixed projectimer_t


	echo -en '\033[0m'
	echo treinamentoemfoco
	echo -en '\033[0;35m'
	wpsql --prefixed treinamentoemfoco_p
	wpsql --prefixed treinamentoemfoco_t


	echo -en '\033[0m'
	echo vamoslonge
	echo -en '\033[0;35m'
	wpsql --prefixed vamoslonge_p
	wpsql --prefixed vamoslonge_t




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
wpsql --import-prefixed pomodoros_bp_ac


#AUTO CREATED DB AUTO SYNC-END
