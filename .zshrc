# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
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
alias wifi='ifconfig'
alias cl='clear'
alias root='sudo zsh'
alias rt='rm * -rf'
alias img='gpicview'
alias ip='ip -color=auto'
alias shutdown='sudo poweroff'
alias diff='diff --color=auto'
# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lh --color=auto'     #size,show type,human readable
alias la='ls -a --color=auto'   #long list,show almost all,show type,human readable
alias lla='ls -lah --color=auto'
alias lr='ls -lrh --color=auto'   #sorted by date,recursive,show type,human readable
alias ll='ls -lh --color=auto'      #long list
alias rmdir='rm -rvdf'
alias cat='bat --theme TwoDark'
alias mutt='neomutt'
alias config='nvim ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias random_background='feh --randomize --bg-fill ~/Pictures/backgrounds/*'

alias zdg='xdg-open'
alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"
alias cv="code"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias sthelp='cat ~/.config/st/man.md'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias hacking='cd ~/Desktop/.hacking/'
alias dev='cd ~/Desktop/dev/'

alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias vi='nvim ./'
gitpush() {
    git add .
    git commit -m "$*"
    git pull
    git push
}
alias gp=gitpush

# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#666'
fi


# Path to your oh-my-zsh installation.
export ZSH="/home/flagmate/.oh-my-zsh"
ZSH_THEME="robbyrussell"

ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )


CASE_SENSITIVE="true"
 HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=13

alias tools="cd ~/.tools/"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'

else
   export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/autojump/autojump.zsh 2>/dev/null

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /home/flagmate/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PATH=$PATH:/home/flagmate/.tools/010editor;export PATH; 

bindkey -v

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

export KEYTIMEOUT=1

