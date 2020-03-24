#/!bin/bash
echo "remove-etchosts"

hosts=`cat /etc/hosts`

hosts=${hosts%%#BSG-START*}
sudo rm -rf /etc/hosts
echo "${hosts}" | sudo tee -a /etc/hosts
echo "######## CHECKING IF HOSTS ARE REPLACED BY BSG ########"
echo "cat /etc/hosts"
cat /etc/hosts
