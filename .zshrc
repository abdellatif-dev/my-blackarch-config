if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export MANPATH="/usr/local/man:$MANPATH"

bindkey "^[[3~" delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

bindkey '^[[5~' beginning-of-line
bindkey '^[[6~' end-of-line

export EDITOR='vim'
setopt autocd            
setopt correct            
setopt interactivecomments
setopt magicequalsubst     
setopt nonomatch          
setopt notify             
setopt numericglobsort   

autoload -U colors && colors
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# vi mode
bindkey -v

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

# Custom ZSH Binds
bindkey '^ ' autosuggest-accept

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

