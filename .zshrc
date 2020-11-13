if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# If you come from bash you might have to change your $PATH.
# my alias
alias wifi='ifconfig wlan0'
alias cl='clear'
alias rt='rm * -rf'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias l='ls -lh --color=auto'     #size,show type,human readable
alias la='ls -a --color=auto'   #long list,show almost all,show type,human readable
alias lla='ls -lah --color=auto'
alias lr='ls -lrh --color=auto'   #sorted by date,recursive,show type,human readable
alias ll='ls -lh --color=auto'      #long list
alias cat='bat --theme TwoDark'
alias rmdir='rm -rvdf'
alias rm='rm -f'
alias mutt='neomutt'
alias python="python2"
alias shred="shred -zf"
alias config='nvim ~/.zshrc' # Quick access to the ~/.zshrc file
alias wget="wget -U 'noleak'"
alias curl="curl --user-agent 'noleak'"
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
# alias random_background='feh --randomize --bg-fill ~/Pictures/backgrounds/*'
alias xdg='xdg-open'
alias pdfviewer='zathura'
alias sthelp='cat ~/.config/st/man.md'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias vi='nvim ./'
# alias to auto cd
alias hacking='cd ~/Desktop/.hacking/'
alias dev='cd ~/Desktop/dev/'
alias tools="cd ~/.tools/"
alias scripts="cd ~/scripts"

export EDITOR='vim'


export ZSH="/home/flagmate/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# vi mode
bindkey -v

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
export MANPATH="/usr/local/man:$MANPATH"
# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

PATH=$PATH:/home/flagmate/.tools/010editor;export PATH; 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export KEYTIMEOUT=1
