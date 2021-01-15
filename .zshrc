# Themes are into ~/.zsh/oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each time
# ZSH_THEME="spaceship"

# Plugin list in ~/.zsh/oh-my-zsh/plugins
plugins=(git git-prompt archlinux nmap systemd)

# Disable oh-my-zsh update
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true

source $HOME/.zsh/oh-my-zsh/oh-my-zsh.sh

# ZSH history file
HISTSIZE=100
SAVEHIST=100
HISTFILE=~/.zsh_history

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

PATH=$PATH:/home/flagmate/.tools/010editor;export PATH;
PATH=$PATH:/home/flagmate/scripts/;export PATH;
PATH=$PATH:/home/flagmate/.tools/myscripts;export PATH;

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/autojump/autojump.zsh 2>/dev/null
source /usr/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source $HOME/aliasrc
eval "$(starship init zsh)"

figlet -f slant flagmate
