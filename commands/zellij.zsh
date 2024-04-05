[ -e $zdotdir/completions/_zellij ] || 
  zellij setup --generate-completion zsh > $zdotdir/completions/_zellij

function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}

eval "$(zellij setup --generate-auto-start zsh)"
