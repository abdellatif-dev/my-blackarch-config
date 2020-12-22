#!/bin/sh
echo "#=====================================#"
echo "# by abdellatif-dev                   #"
echo "# please follow me on                 #"
echo "# github:                             #"
echo "# https://github.com/abdellatif-dev   #"
echo "#                                     #"
echo "# tryhackme.com:                      #"
echo "# https://tryhackme.com/p/flagmate    #"
echo "#                                     #"
echo "# twitter:                            #"
echo "# https://twitter.com/DevAbdellatif   #"
echo "#                                     #"
echo "#=====================================#"

printf "\n"
printf "\n"

echo "welcome $USER"
sleep 2
echo "blackarch config preparing installation"
sleep 1

printf "\n"

updateconf="--noconfirm"
installconfirm="--needed --noconfirm"
extra="rofi lxappearance keyscreen breeze breeze-icons thunar xarchiver bat"
aurstuff="polybar dmenu-abdellatif brave-bin diff-so-fancy picom-jonaburg-git"
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
read -r vimconfrim
case $vimconfrim in
   "y") echo "installing vim" &&sudo pacman -S vim neovim vifm $installconfirm;;
   "Y") echo "installing vim" &&sudo pacman -S vim neovim vifm $installconfirm;;
     *) echo "skipping";;
esac

sleep 1
printf "\n"

printf "install mutt email client[Y/n]: "
read -r muttconfirm
case $muttconfirm in
   "y") echo "installing mutt" &&sudo pacman  -S neomutt $installconfirm;;
   "Y") echo "installing mutt" &&sudo pacman  -S neomutt $installconfirm;;
    *) echo "skipping";;
esac

sleep 1
printf "\n"


printf "install terminals set[Y/n]: "
read -r terminalsconfirm
case $terminalsconfirm in
   "y") echo "installing terminals" &&sudo pacman -S terminator termite xfce4-terminal $installconfirm;;
   "Y") echo "installing terminals" &&sudo pacman -S terminator termite xfce4-terminal $installconfirm;;
     *) echo "skipping";;
esac

sleep 1
printf "\n"


printf "install neofetch set[Y/n]: "
read -r neofetchconfirm
case $neofetchconfirm in
   "y") echo "installing neofetch" &&sudo pacman -S neofetch $installconfirm;;
   "Y") echo "installing neofetch" &&sudo pacman -S neofetch $installconfirm;;
     *) echo "skipping";;
esac

sleep 1
printf "\n"


printf "install aur packages[Y/n]: "
read -r aurconfirm
case $aurconfirm in
   "y") echo "installing aur packages" &&yay -S $aurstuff $installconfirm;;
   "Y") echo "installing aur packages" &&yay -S $aurstuff $installconfirm;;
     *) echo "skipping";;
esac

printf "\n"
sleep 1


printf "install extra  [Y/n]: "
read -r stconfirm
case $stconfirm in
   "y") echo "installing extra " && sudo pacman -S $extra $noconfirm\
        && yay -S brave-bin $noconfirm;;
   "Y") echo "installing extra " && sudo pacman -S $extra $noconfirm\
        && yay -S brave-bin $noconfirm;;
     *) echo "skipping";;
esac

printf "\n"
sleep 1

printf "obs-studio or simplescreenrecorder"
read -r stconfirm
case $stconfirm in
   "simplescreenrecorder") echo "installing extra " && sudo pacman -S simplescreenrecorder $noconfirm\
        && yay -S brave-bin $noconfirm;;
   "obs-studio") echo "installing extra " && sudo pacman -S obs-studio $noconfirm\
        && yay -S brave-bin $noconfirm;;
     *) echo "skipping";;
esac
printf "\n"
