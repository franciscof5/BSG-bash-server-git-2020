#/!bin/bash
echo "create-etchosts.sh"

conffile="/bin/bsg.conf"

if [ -f "$conffile" ]
then
	source $conffile
else
	echo "$conffile not found."
	echo "You must create a $conffile file before install, please check README"
fi

#GET CONTENT FROM ACTUAL /ECT/HOSTS

source bsg-scripts/remove-bsghosts.sh

hosts=`cat /etc/hosts`

hosts="${hosts}


#BSG-START
"

for i in "${domains[@]}"
do
	:	
	hosts="${hosts}$LOCAL_IP		$i	www.$i
"
done

hosts="${hosts}#BSG-END"

echo "${hosts}"
sudo rm -rf /etc/hosts
echo "${hosts}" | sudo tee -a /etc/hosts
echo "######## CHECKING IF HOSTS ARE REPLACED BY BSG ########"
echo "cat /etc/hosts"
cat /etc/hosts
