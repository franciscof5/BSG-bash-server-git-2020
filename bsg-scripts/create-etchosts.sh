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

echo "127.0.0.1       localhost
127.0.1.1       francisco-270E5J-2570EJ
0.0.0.0         treinamentoemfoco.com.br
0.0.0.0         cursowp.com.br

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters" > sudo tee /etc/hosts
