#!/bin/zsh

for file in $zdotdir/plugins/*.zsh; do
  source ${file}
done
