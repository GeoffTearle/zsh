#
# ~/.zshrc
#

# If not running interactively, don't do anything
export HISTFILE="$STATE_HOME"/zsh/history

[[ $- != *i* ]] && return

autoload -Uz +X compinit && compinit
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

export DO_NOT_TRACK=1

ZSH_AUTOSUGGEST_USE_ASYNC="true"

[[ -e ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# Source antidote.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER="bat --style='changes,rule'"

eval "$(starship init zsh)"

export PATH="$PATH:$ZDOTDIR/.antidote/bundle/wfxr/forgit/bin" # cant seem to get the antigen vars to work

# exa
alias ls="eza --icons"
alias ll="eza --long --group --icons --header --git"
alias la="eza --long --all --group --icons --header --git"

function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}

add-zsh-hook -Uz chpwd chpwd-osc7-pwd

precmd() {
    print -Pn "\e]133;A\e\\"
}

source ${ZDOTDIR:-~}/platform-specific.zsh

# setup ssh agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval `ssh-agent`
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

bindkey -e
