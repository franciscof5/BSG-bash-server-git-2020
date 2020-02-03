#/bin/bash
echo "Bin Server Git Management"
echo "By Francisco Matelli Matulovic"
echo "made to deploy fnetwork"

echo "Installing wpsql-cli on current user's bin directory to make avaiable globally, at any directory at the system"
rm -rf /bin/bsg
rm -rf /bin/bsg.conf
cp bsg.sh /bin/bsg
cp bsg.conf /bin/bsg.conf
#echo "(cd ~/bin/wpsql-cli-folder/ && exec ~/bin/wpsql-cli-folder/wpsql-cli.sh \$1 \$2 \$3)" > ~/bin/wpsql
#ln -s ~/bin/wpsql-cli-folder/wpsql-cli.sh ~/bin/wpsql-cli
sudo chmod +x /bin/bsg
echo "Installation successfully. Now you can run 'bsg' command from any directory"