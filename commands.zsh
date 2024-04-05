#!/bin/zsh

for file in $zdotdir/commands/*.zsh; do
  source ${file}
done
