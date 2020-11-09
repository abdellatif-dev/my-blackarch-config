#!/bin/sh
echo "welcome $USER"
sleep 2
echo "blackarch config preparing installation"
sleep 1

printf "\n"

updateconf="--noconfirm"
installconfirm="--needed --noconfirm"

printf "Update packages[Y/n]: "
read -r confirm
case $confirm in
   "y") echo "updating you packages" &&sudo pacman -Syu "$updateconf";;
   "Y") echo "updating you packages" &&sudo pacman -Syu "$updateconf";;
     *) echo "skipping";;
esac

sleep 1
printf "\n"

echo "install blackarch tools"
printf "this can take up to 4 hours[Y/n]: "
read -r confirm
case $confirm in
   "y") echo "installing blackarch" &&sudo pacman -S blackarch $installconfirm;;
   "Y") echo "installing blackarch" &&sudo pacman -S blackarch $installconfirm;;
     *) echo "skipping";;
esac

sleep 1
printf "\n"

printf "install vim[Y/n]: "
read -r confirm
case $confirm in
   "y") echo "installing vim" &&sudo pacman -S vim neovim vifm $installconfirm;;
   "Y") echo "installing vim" &&sudo pacman -S vim neovim vifm $installconfirm;;
     *) echo "skipping";;
esac

sleep 1
printf "\n"

printf "install mutt email client[Y/n]: "
read -r confirm
case $confirm in
   "y") echo "installing mutt" &&sudo pacman  -S neomutt $installconfirm;;
   "Y") echo "installing mutt" &&sudo pacman  -S neomutt $installconfirm;;
    *) echo "skipping";;
esac

sleep 1
printf "\n"


printf "install terminals set[Y/n]: "
read -r confirm
case $confirm in
   "y") echo "installing terminals" &&sudo pacman -S termintator termite xfce4-terminal $installconfirm;;
   "Y") echo "installing terminals" &&sudo pacman -S termintator termite xfce4-terminal $installconfirm;;
     *) echo "skipping";;
esac

sleep 1
printf "\n"

