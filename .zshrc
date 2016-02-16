source $HOME/.antigen/antigen.zsh

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin:$HOME/.cabal/bin
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home

source $HOME/.profile

export PATH=$PATH:"/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/Users/lander/go/bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

autoload run-help
HELPDIR=/usr/local/share/zsh/help

SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt NO_HIST_BEEP
setopt SHARE_HISTORY

bindkey -e
#bindkey '^[R' history-incremental-search-backward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false
PURE_PROMPT_SYMBOL=\$

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle skx/sysadmin-util
antigen bundle tarruda/zsh-autosuggestions
#antigen bundle tmux


antigen apply

# bind UP and DOWN arrow keys -- this is for history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Skip forward/back a word with opt-arrow
bindkey '[C' forward-word
bindkey '[D' backward-word

# Skip to start/end of line with cmd-arrow
bindkey '[E' beginning-of-line
bindkey '[F' end-of-line

# Delete word with opt-backspace/opt-delete
bindkey '[G' backward-kill-word
bindkey '[H' kill-word

# Delete line with cmd-backspace
bindkey '[I' kill-whole-line

man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
