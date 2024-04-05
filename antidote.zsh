[[ -e $zdotdir/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote.git $zdotdir/.antidote

# Source antidote.
source $zdotdir/.antidote/antidote.zsh

export ZSH=$(antidote path ohmyzsh/ohmyzsh)
export ZSH_CACHE_DIR="$ZSH/cache"

antidote load
