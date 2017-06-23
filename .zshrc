stty -ixon
 
ZSH_THEME="cypher"
plugins=(git golang history tmux archlinux z)

export ZSH=~/.zgen/robbyrussell/oh-my-zsh-master/oh-my-zsh.sh
export GOPATH=$HOME/Work/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.linuxbrew/bin

if ! (( $+functions[zgen] )); then
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/z
    zgen save
fi

source ~/.zgen/zgen.zsh
source $ZSH/oh-my-zsh.sh
[ -f ~/.z.aliases ] && . ~/.z.aliases

eval "$(direnv hook zsh)"
