setopt noflowcontrol
 
ZSH_THEME="sunaku"
plugins=(git golang history tmux archlinux z)

[ ! -f ~/.zgen/zgen.zsh ] && git clone https://github.com/tarjoilija/zgen ~/.zgen
source ~/.zgen/zgen.zsh
source $ZSH/oh-my-zsh.sh

[ ! -f ~/.asdf/asdf.sh ] && git clone https://github.com/asdf-vm/asdf.git ~/.asdf
source ~/.asdf/asdf.sh
source ~/.asdf/completions/asdf.bash

[ -f ~/.zsh.aliases ] && . ~/.zsh.aliases

export ZSH=~/.zgen/robbyrussell/oh-my-zsh-master/oh-my-zsh.sh
export PATH=$HOME/bin:$PATH
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.linuxbrew/bin
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
export PATH=$PATH:/root/.gem/ruby/2.5.0/bin
export GPG_TTY=$(tty)

NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/z
    zgen save
fi

if (( $+commands[direnv] )) ; then
    eval "$(direnv hook zsh)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.fzf.colors ] && source ~/.fzf.colors

if [ "$TMUX" = "" ]; then tmux -2u new; fi
