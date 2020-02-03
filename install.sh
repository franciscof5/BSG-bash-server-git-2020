#/bin/bash
echo "Bin Server Git Management"
echo "By Francisco Matelli Matulovic"
echo "Made to deploy f5sites fnetwork"

rm -rf /bin/bsg
rm -rf /bin/bsg.conf
cp bsg.sh /bin/bsg
cp bsg.conf /bin/bsg.conf

#SCRIPTS
rm -rf /bin/gac
cp bsg-scripts/gac /bin/gac

rm -rf /bin/gp
cp bsg-scripts/gp /bin/gp

#echo "(cd ~/bin/wpsql-cli-folder/ && exec ~/bin/wpsql-cli-folder/wpsql-cli.sh \$1 \$2 \$3)" > ~/bin/wpsql
#ln -s ~/bin/wpsql-cli-folder/wpsql-cli.sh ~/bin/wpsql-cli
sudo chmod +x /bin/bsg
echo "Installation successfully. Now you can run 'bsg' command from any directory"