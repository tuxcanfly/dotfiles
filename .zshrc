# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

stty -ixon
setopt noflowcontrol
 
ZSH_THEME="flazz"
plugins=(git golang history tmux archlinux z)

[ ! -f ~/.zgen/zgen.zsh ] && git clone https://github.com/tarjoilija/zgen ~/.zgen
source ~/.zgen/zgen.zsh
source $ZSH/oh-my-zsh.sh

[ ! -f ~/.asdf/asdf.sh ] && git clone https://github.com/asdf-vm/asdf.git ~/.asdf
source ~/.asdf/asdf.sh
source ~/.asdf/completions/asdf.bash

[ -f ~/.zsh.aliases ] && . ~/.zsh.aliases

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	eval "$("$BASE16_SHELL/profile_helper.sh")"

if [[ $TERM =~ konsole.* ]]; then
    export FZF_DEFAULT_OPTS='--color fg+:5,hl+:6'
fi

export TERM=xterm-256color

export ZSH=~/.zgen/robbyrussell/oh-my-zsh-master/oh-my-zsh.sh
export PATH=$HOME/bin:$PATH
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
export PATH=$PATH:/root/.gem/ruby/2.5.0/bin
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
export PATH=$PATH:/root/.gem/ruby/2.5.0/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/snap/bin
export GPG_TTY=$(tty)
export NODE_OPTIONS="--experimental-repl-await"

NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

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

# set PATH for cuda 10.1 installation
if [ -d "/usr/local/cuda-10.2/bin/" ]; then
    export PATH=/usr/local/cuda-10.2/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi
export PATH="/home/tuxcanfly/Work/git-fuzzy/bin:$PATH"
export LANG=en_US.utf8
