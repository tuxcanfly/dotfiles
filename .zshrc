setopt noflowcontrol
 
ZSH_THEME="sunrise"
plugins=(git golang history tmux archlinux z)

export ZSH=~/.zgen/robbyrussell/oh-my-zsh-master/oh-my-zsh.sh
export PATH=$HOME/bin:$PATH
export GOPATH=$HOME/Work/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.linuxbrew/bin
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin

NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

[ ! -f ~/.zgen/zgen.zsh ] && git clone git@github.com:tarjoilija/zgen ~/.zgen
source ~/.zgen/zgen.zsh
source $ZSH/oh-my-zsh.sh
[ -f ~/.zsh.aliases ] && . ~/.zsh.aliases

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/z
    zgen save
fi

. ~/.asdf/asdf.sh
source ~/.asdf/completions/asdf.bash

if (( $+commands[direnv] )) ; then
    eval "$(direnv hook zsh)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
