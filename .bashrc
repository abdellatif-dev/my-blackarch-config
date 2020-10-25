# colors
darkgrey="$(tput bold ; tput setaf 0)"
white="$(tput bold ; tput setaf 7)"
red="$(tput bold ; tput setaf 4)"
blue="$(tput bold; tput setaf 4)"
cyan="$(tput bold; tput setaf 6)"
nc="$(tput sgr0)"

# exports
export PATH="${HOME}/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:"
export PATH="${PATH}/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:"
export PS1="\[$blue\][\[$white\]\u\[$red\]@\[$white\]\H\[$blue\]]-\[$blue\][\[$white\]\@\[$blue\]]-[$darkgrey\]\w\[$darkgrey\]\[$blue\]]\\[$darkgrey\] \n(\#) $: \[$nc\]"
export LD_PRELOAD=""
export EDITOR="vim"

# alias
alias ls="ls --color"
alias vi="vim"
alias shred="shred -zf"
alias wget="wget -U 'noleak'"
alias curl="curl --user-agent 'noleak'"

# my alias
alias wifi="sudo ifconfig"
alias cl="clear"
alias root="sudo zsh"
alias rt="rm * -rf"
alias shutdown="sudo poweroff"

# ls, the common ones I use a lot shortened for rapid fire usage
alias l="ls -lh"     #size,show type,human readable
alias la="ls -a"   #long list,show almost all,show type,human readable
alias lla="ls -lah"
alias lr="ls -lrh"   #sorted by date,recursive,show type,human readable
alias ll="ls -lh"      #long list


alias config="vim ~/.zshrc" # Quick access to the ~/.zshrc file

alias grep="grep --color"
alias sgrep="grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} "

alias random_background="feh --randomize --bg-fill ~/Pictures/backgrounds/*"

alias t="tail -f"


alias dud="du -d 1 -h"
alias duf="du -sh *"
alias fd="find . -type d -name"
alias ff="find . -type f -name"

alias h="history"
alias hgrep="fc -El 0 | grep"
alias help="man"
alias p="ps -f"
alias sortnr="sort -n -r"
alias unexport="unset"

alias hacking="cd ~/Desktop/.hacking/"
alias dev="cd ~/Desktop/dev/"

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias vim="vim"
alias vi="vim ./"

# source files
[ -r /usr/share/bash-completion/completions ] &&
  . /usr/share/bash-completion/completions/*
