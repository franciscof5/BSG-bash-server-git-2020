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
cp bsg-scripts/cdl.sh /bin/cdl
sudo chmod +x /bin/cdl

rm -rf /bin/cdr
cp bsg-scripts/cdr.sh /bin/cdr
sudo chmod +x /bin/cdr

rm -rf /bin/cdr-gp
cp bsg-scripts/cdr-gp.sh /bin/cdr-gp
sudo chmod +x /bin/cdr-gp

rm -rf /bin/gac
cp bsg-scripts/gac.sh /bin/gac
sudo chmod +x /bin/gac

rm -rf /bin/gp
cp bsg-scripts/gp.sh /bin/gp
sudo chmod +x /bin/gp

rm -rf /bin/mld
cp bsg-scripts/mld.sh /bin/mld
sudo chmod +x /bin/mld

rm -rf /bin/create-vhosts
cp bsg-scripts/create-vhosts.sh /bin/create-vhosts
sudo chmod +x /bin/create-vhosts

rm -rf /bin/update-symlinks
cp bsg-scripts/update-symlinks.sh /bin/update-symlinks
sudo chmod +x /bin/update-symlinks

rm -rf /bin/create-etchosts
cp bsg-scripts/create-etchosts.sh /bin/create-etchosts
sudo chmod +x /bin/create-etchosts

rm -rf /bin/create-etchosts-pomo
cp bsg-scripts/create-etchosts-pomo.sh /bin/create-etchosts-pomo
sudo chmod +x /bin/create-etchosts-pomo

rm -rf /bin/remove-bsghosts
cp bsg-scripts/remove-bsghosts.sh /bin/remove-bsghosts
sudo chmod +x /bin/remove-bsghosts

rm -rf /bin/dbs
cp bsg-scripts/dbs.sh /bin/dbs
sudo chmod +x /bin/dbs

rm -rf /bin/dbs-posts
cp bsg-scripts/dbs-posts.sh /bin/dbs-posts
sudo chmod +x /bin/dbs-posts
#echo "(cd ~/bin/wpsql-cli-folder/ && exec ~/bin/wpsql-cli-folder/wpsql-cli.sh \$1 \$2 \$3)" > ~/bin/wpsql
#ln -s ~/bin/wpsql-cli-folder/wpsql-cli.sh ~/bin/wpsql-cli

echo "Installation successfully. Now you can run 'bsg' command from any directory"
