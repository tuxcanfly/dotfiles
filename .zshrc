stty -ixon
if [ -z "$TMUX" ]; then
  exec tmux -2u new
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt noflowcontrol
setopt SHARE_HISTORY
 
#plugins=(git golang history tmux archlinux z)

#[ ! -f ~/.zgen/zgen.zsh ] && git clone https://github.com/tarjoilija/zgen ~/.zgen
#source ~/.zgen/zgen.zsh
#source $ZSH/oh-my-zsh.sh


#if ! zgen saved; then
    #zgen oh-my-zsh
    #zgen oh-my-zsh plugins/z
    #zgen save
#fi

export TERM=xterm-256color
export NPM_PACKAGES=$HOME/.npm-packages
export ZSH=~/.zgen/robbyrussell/oh-my-zsh-master/oh-my-zsh.sh
export PATH=$HOME/bin:$PATH
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Work/git-fuzzy/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$NPM_PACKAGES/bin
export GPG_TTY=$(tty)
export NODE_OPTIONS="--experimental-repl-await"
export LANG=en_US.utf8
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=1000

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
[ -f ~/.fzf.colors ] && . ~/.fzf.colors
[ -f ~/.asdf/asdf.sh ] && . ~/.asdf/asdf.sh
[ -f ~/.zsh.aliases ] && . ~/.zsh.aliases
[ -f ~/Work/fzf-tab/fzf-tab.zsh ] && . ~/Work/fzf-tab/fzf-tab.zsh
[ -f /usr/share/z/z.sh ] && . /usr/share/z/z.sh

#eval "$(starship init zsh)"
#eval "$(shelby init zsh)"
#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/local/bin/bitcomplete bit

#if command -v promptus >/dev/null; then
    #precmd() { PROMPT="$(eval 'promptus $?')" }
#fi

source ~/.powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '' autosuggest-accept

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.colors ] && source ~/.fzf.colors
