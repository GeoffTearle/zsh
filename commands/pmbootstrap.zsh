if command -v pmbootstrap > /dev/null; then
  autoload bashcompinit
  bashcompinit
  eval "$(register-python-argcomplete pmbootstrap)"
fi
