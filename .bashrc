# colors
darkgrey="$(tput bold ; tput setaf 0)"
white="$(tput bold ; tput setaf 7)"
red="$(tput bold ; tput setaf 4)"
blue="$(tput bold; tput setaf 4)"
cyan="$(tput bold; tput setaf 6)"
nc="$(tput sgr0)"

# exports
export EDITOR="vim"


source $HOME/aliasrc
PATH=$PATH:/home/flagmate/.tools/010editor;export PATH; 
PATH=$PATH:/home/flagmate/scripts/;export PATH; 
PATH=$PATH:/home/flagmate/.tools/myscripts;export PATH; 

# source files

[ -r /usr/share/bash-completion/completions ] &&
  . /usr/share/bash-completion/completions/*

PATH=$PATH:/home/flagmate/.tools/010editor;export PATH; # ADDED BY INSTALLER - DO NOT EDIT OR DELETE THIS COMMENT - 87FF8EFC-483D-BCAA-D67D-735CF60410D1 70E93305-2946-284C-994C-C8410CE09AA7

eval "$(starship init bash)"
