echo "Welcome to Debian to LMDE tool. This tool will convert your debian to LMDE"
sleep 5

#Installing GPG tool
apt install -y gpg

#Removing old sources
rm /etc/apt/sources.list
rm -r /etc/apt/trusted.gpg.d
#Installing new keys and sources
cp -r trusted.gpg.d /etc/apt/
cp official-package-repositories.list /etc/apt/sources.list.d/official-package-repositories.list
echo "Converting Now..."
sleep 3
apt update && apt upgrade -y
xargs apt-get install -y < list-packages-mint
echo "If no errors... That's complete"
sleep 2
echo "Post-Concerting config"
rm /etc/network/interfaces
cp official-package-repositories.pref /etc/apt/preferences.d/official-package-repositories.pref
apt update
echo "Finished. Can reboot now"
