alias vim=nvim
alias vimr='open -a vimr.app "$@"'
alias cat=ccat
export PATH="$HOME/.rvm/bin:$HOME/.local/bin:$PATH" # Add RVM to PATH for scripting
export EDITOR="nvim"
export PATH=/usr/pkg/sbin:/usr/pkg/bin:/Library/Haskell/bin:$PATH
export MANPATH=/usr/pkg/man:$MANPATH

source dnvm.sh
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/lander/.boot2docker/certs/boot2docker-vm

