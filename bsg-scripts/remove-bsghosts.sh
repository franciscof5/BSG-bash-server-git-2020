#/!bin/bash
echo "remove-etchosts"

echo "MAKING /etc/hosts-bkp"
sudo cp /etc/hosts /etc/hosts-bkp

hosts=`cat /etc/hosts`
hosts=${hosts%%#BSG-START*}

echo "REPLACING"
sudo rm -rf /etc/hosts
echo "${hosts}" | sudo tee -a /etc/hosts
echo "######## CHECKING IF HOSTS ARE REPLACED BY BSG ########"
echo "cat /etc/hosts"
cat /etc/hosts
