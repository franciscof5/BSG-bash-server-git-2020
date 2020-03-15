#/bin/bash
echo "Bin Server Git Management"
echo "By Francisco Matelli Matulovic"
echo "Made to deploy f5sites fnetwork"

rm -rf /bin/bsg
rm -rf /bin/bsg.conf
cp bsg.sh /bin/bsg
cp bsg.conf /bin/bsg.conf
sudo chmod +x /bin/bsg

#SCRIPTS
rm -rf /bin/cdl
cp bsg-scripts/cdl /bin/cdl
sudo chmod +x /bin/cdl

rm -rf /bin/gac
cp bsg-scripts/gac /bin/gac
sudo chmod +x /bin/gac

rm -rf /bin/gp
cp bsg-scripts/gp /bin/gp
sudo chmod +x /bin/gp

rm -rf /bin/mld
cp bsg-scripts/mld /bin/mld
sudo chmod +x /bin/mld

rm -rf /bin/create-sites-available
cp bsg-scripts/create-sites-available /bin/create-sites-available
sudo chmod +x /bin/create-sites-available

#echo "(cd ~/bin/wpsql-cli-folder/ && exec ~/bin/wpsql-cli-folder/wpsql-cli.sh \$1 \$2 \$3)" > ~/bin/wpsql
#ln -s ~/bin/wpsql-cli-folder/wpsql-cli.sh ~/bin/wpsql-cli

echo "Installation successfully. Now you can run 'bsg' command from any directory"
