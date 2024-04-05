#
# ~/.zshrc
#

# not sure anything actually uses this?
export DO_NOT_TRACK=1
export HISTFILE="$STATE_HOME"/zsh/history
export ZSH_COMPDUMP="$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

zdotdir=${ZDOTDIR:-~}

fpath=($zdotdir/completions $fpath)

# Set up ssh agent
source $zdotdir/ssh-agent.zsh

# Load platform specific config
source $zdotdir/platform.zsh

# Load term specific config
source $zdotdir/term.zsh

# Load local config
source $zdotdir/local.zsh

zmodload -i zsh/complist
autoload -Uz +X compinit && compinit
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$ZSH_COMPDUMP"

source $zdotdir/rehash.zsh 

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

ZSH_AUTOSUGGEST_USE_ASYNC="true"

source $zdotdir/antidote.zsh
source $zdotdir/plugins.zsh

source $zdotdir/commands.zsh

eval "$(starship init zsh)"
# emacs mode
# ToDo: look into the various vim extensions
bindkey -e
