# eza
# ToDo: move to command specific section
if command -v eza > /dev/null; then 
  alias ls="eza --icons"
  alias ll="eza --long --group --icons --header --git"
  alias la="eza --long --all --group --icons --header --git"
fi

