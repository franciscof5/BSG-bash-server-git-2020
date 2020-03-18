#/!bin/bash
echo "create-etchosts.sh"

conffile="bsg.conf"

if [ -f "$conffile" ]
then
	#echo "$conffile loaded"
	source $conffile
else
	echo "$conffile not found."
	echo "You must create a $conffile file before install, please check README"
fi

hosts="127.0.0.1       localhost
127.0.1.1       francisco-270E5J-2570EJ

#AUTOMATICALLY CREATED BY BSG
"
for i in "${domains[@]}"
do
	:	
	hosts="${hosts}$LOCAL_IP		$i
"
done

hosts="${hosts}
# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters"

echo "${hosts}"
sudo rm -rf /etc/hosts
echo "${hosts}" | sudo tee -a /etc/hosts
echo "######## CHECKING IF HOSTS ARE REPLACED BY BSG ########"
echo "cat /etc/hosts"
cat /etc/hosts
