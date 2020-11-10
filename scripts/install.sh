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
read -r vimconfrim
case $vimconfrim in
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


printf "install neofetch set[Y/n]: "
read -r confirm
case $confirm in
   "y") echo "installing neofetch" &&sudo pacman -S neofetch $installconfirm;;
   "Y") echo "installing neofetch" &&sudo pacman -S neofetch $installconfirm;;
     *) echo "skipping";;
esac

sleep 1
printf "\n"


printf "install polybar[Y/n]: "
read -r confirm
case $confirm in
   "y") echo "installing polybar" &&yay -S polybar $installconfirm;;
   "Y") echo "installing polybar" &&yay -S polybar $installconfirm;;
     *) echo "skipping";;
esac

sleep 1
printf "\n"

printf "install st terminal [Y/n]: "
read -r confirm
case $confirm in
   "y") echo "installing st terminal" && git clone https://github.com/abdellatif-dev/st.git\
         && cd st\
         && sudo make clean install 2>/dev/null && make man 2>/dev/null 1>/dev/null;;
   "Y") echo "installing st terminal" && git clone https://github.com/abdellatif-dev/st.git\
         && cd st\
         && sudo make clean install 2>/dev/null && make man 2>/dev/null 1>/dev/null;;
     *) echo "skipping";;
esac

sleep 1

printf "configuring"

sleep 1
printf "\n"

echo "configuring awesome" && cp -r ../.config/awesome ~/.config/;;

sleep 1
printf "\n"


case $vimconfrim in
   "Y") echo "configuring vim" && cp -r ../.vim* ~/;;
   "y") echo "configuring vim" && cp -r ../.vim* ~/;;
     *) echo "skipping";;
esac

sleep 1
printf "\n"
