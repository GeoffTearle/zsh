#
# ~/.zshrc
#

export HISTFILE="$STATE_HOME"/zsh/history

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

zdotdir=${ZDOTDIR:-~}

autoload -Uz +X compinit && compinit
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# not sure anything actually uses this?
export DO_NOT_TRACK=1

ZSH_AUTOSUGGEST_USE_ASYNC="true"

[[ -e $zdotdir/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote.git $zdotdir/.antidote

# Source antidote.
source $zdotdir/.antidote/antidote.zsh
antidote load

# ToDo: move to command specific section
if command -v bat > /dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export PAGER="bat --style='changes,rule'"
fi

eval "$(starship init zsh)"

export PATH="$PATH:$ZDOTDIR/.antidote/bundle/wfxr/forgit/bin" # cant seem to get the antigen vars to work

# eza
# ToDo: move to command specific section
if command -v eza > /dev/null; then 
  alias ls="eza --icons"
  alias ll="eza --long --group --icons --header --git"
  alias la="eza --long --all --group --icons --header --git"
fi

# Set up ssh agent
source $zdotdir/ssh-agent.zsh

# Load platform specific config
source $zdotdir/platform/platform.zsh

# Load term specific config
source $zdotdir/term/term.zsh

# Load local config
source $zdotdir/local.zsh

# emacs mode
# ToDo: look into the various vim extensions
bindkey -e
