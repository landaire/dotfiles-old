alias vim=nvim
alias vimr='open -a vimr.app "$@"'
alias cat=ccat
alias lsl="ls -lah"
alias lst="ls -laht"
export GO15VENDOREXPERIMENT=1
export PATH="$HOME/bin:$HOME/.rvm/bin:$HOME/.local/bin:$PATH" # Add RVM to PATH for scripting
export EDITOR="nvim"
export PAGER="less"
export PATH=/usr/pkg/sbin:/usr/pkg/bin:/Library/Haskell/bin:$PATH
export RUST_SRC_PATH=/usr/local/src/rust/src
#export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
#export TOOLCHAINS=swift

export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/lander/.boot2docker/certs/boot2docker-vm

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin:$HOME/.cabal/bin
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home


export PATH="$HOME/.cargo/bin:$PATH"
alias prettyjson="python -m json.tool"
