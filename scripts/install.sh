#!/bin/sh

echo "blackarch config preparing installation"
sleep 1

updateconf="--noconfirm"
installconfirm="--needed --noconfirm"

printf "Update packages[Y/n]: "
read -r confirm
case $confirm in
   "y") echo "updating you packages" && pacman -Syu "$updateconf";;
   "Y") echo "updating you packages" && pacman -Syu "$updateconf";;
   "N") echo "skipping";;
   "n") echo "skipping";;
     *) echo "skipping";;
esac
sleep 1

echo "install blackarch tools"
printf "this can take up to 4 hours[Y/n]: "
read -r confirm
case $confirm in
   "y") echo "installing blackarch" && pacman -S blackarch $installconfirm;;
   "Y") echo "installing blackarch" && pacman -S blackarch $installconfirm;;
   "N") echo "skipping";;
   "n") echo "skipping";;
     *) echo "skipping";;
esac


# echo "Installing ohmyzsh"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"