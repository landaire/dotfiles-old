source $HOME/.antigen/antigen.zsh

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin:$HOME/.cabal/bin
export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)

source $HOME/.profile

export PATH=$PATH:"/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/Users/lander/go/bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

autoload run-help
HELPDIR=/usr/local/share/zsh/help

SAVEHIST=500
HISTFILE=~/.zsh_history

bindkey -e
bindkey '^R' history-incremental-search-backward

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle tmux

# bind UP and DOWN arrow keys -- this is for history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

antigen apply

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

