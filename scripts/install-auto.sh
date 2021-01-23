#!/bin/sh
updateconf="--noconfirm"
installconfirm="--needed --noconfirm"
extra="rofi lxappearance keyscreen breeze breeze-icons pacmanfm xarchiver bat"
aurstuff="polybar dmenu-abdellatif st-abdellatif-git brave-bin diff-so-fancy "

sudo pacman -Syu "$updateconf"
sudo pacman -S vim neovim vifm $installconfirm
sudo pacman -S yay
sudo pacman -S terminator screenfetch screenkey $installconfirm
yay -S $aurstuff $installconfirm
sudo pacman -S $extra $noconfirm
sudo pacman -S simplescreenrecorder $noconfirm
