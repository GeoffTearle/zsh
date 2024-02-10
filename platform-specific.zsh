case $(uname -s) in
  Linux)
	  DISTRO=$(awk -F'=' '/^ID=/ {print tolower($2)}' /etc/*-release 2> /dev/null)
    if [[ $DISTRO = "alpine" ]]; then
      source ${ZDOTDIR:-~}/alpine.zsh

    elif [[ $DISTRO = "arch" ]]; then
      # arch
      source ${ZDOTDIR:-~}/arch.zsh

    fi
  ;;
  Darwin)
	  source ${ZDOTDIR:-~}/mac.zsh
  ;;
esac

