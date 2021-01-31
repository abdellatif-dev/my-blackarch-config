# Flex on the ubuntu users and systemd users
screenfetch
# Plugin list in ~/.zsh/oh-my-zsh/plugins
plugins=(git git-prompt archlinux nmap systemd)

source $HOME/.zsh/oh-my-zsh/oh-my-zsh.sh

export EDITOR="nvim"

# Fancy auto-complete (with vi movement)
autoload -Uz compinit
zstyle ':completion:*' menu select=0
zmodload zsh/complist
zstyle ':completion:*' format '>>> %d'
compinit
_comp_options+=(globdots) # hidden files are included

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor depending on current mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # Initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;}


export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;3'

export MANPATH="/usr/local/man:$MANPATH"

bindkey "^[[3~" delete-char

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

PATH=$PATH:/home/flagmate/scripts/;export PATH;
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source $HOME/aliasrc


autoload -U colors && colors
# Custom ZSH Binds
bindkey '^ ' autosuggest-accept

autoload edit-command-line; zle -N edit-command-line
bindkey '^B' edit-command-line


# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#PROMPT='%F{10}[%B%F{7}%n%f%b%F{5}@%f%B%F{7}%m%f%b%F{10}]%f-%F{10}[%f%B%F{7}%t %f%b%F{10}]%f-%F{10}[%f%F{3}%B%1~%b%f%F{10}]%f
#%F{10}[%B%F{7}%h%f%b%F{10}|%B%F{7}%?%f%b%F{10}]%f-%F{3}%B$%b%f: '

eval "$(starship init zsh)"
