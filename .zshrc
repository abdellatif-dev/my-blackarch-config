# by abdellatif-dev
export ZSH="/home/flagmate/.oh-my-zsh"

plugins=(git)
source $ZSH/oh-my-zsh.sh
export ARCHFLAGS="-arch x86_64"


export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export MANPATH="/usr/local/man:$MANPATH"

bindkey "^[[3~" delete-char

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zshhistory
setopt appendhistory

export EDITOR='vim'
setopt autocd            
setopt correct            
setopt interactivecomments
setopt magicequalsubst     
setopt nonomatch          
setopt notify             
setopt numericglobsort   

# Custom ZSH Binds
bindkey '^ ' autosuggest-accept

autoload -U colors && colors
# Custom ZSH Binds
bindkey '^ ' autosuggest-accept

autoload edit-command-line; zle -N edit-command-line
bindkey '^E' edit-command-line

# vi mode
bindkey -v

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



# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/autojump/autojump.zsh 2>/dev/null
source /usr/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
#source ~/.config/zsh/nicoulaj.zsh-theme
source $HOME/aliasrc

#PROMPT="%F{10}[%B%F{7}%n%f%b%F{5}@%f%B%F{7}%m%f%b%F{10}]%f-%F{10}[%f%B%F{7}%t%f%b%F{10}]%f-%F{10}[%f%F{3}%B%1~%b%f%F{10}]%f 
#%F{10}[%B%F{7}%h%f%b%F{10}|%B%F{7}%?%f%b%F{10}]%f-%F{3}%B$%b%f: "

PATH=$PATH:/home/flagmate/.tools/010editor;export PATH; 
PATH=$PATH:/home/flagmate/scripts/;export PATH; 
PATH=$PATH:/home/flagmate/.tools/myscripts;export PATH; 


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(starship init zsh)"

figlet -f slant flagmate 
