if command -v bat > /dev/null; then
  # alias batpager="bat --style='changes,rule'"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export PAGER="bat --style='changes,rule'"
  alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
fi


