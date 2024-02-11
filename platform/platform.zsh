# ToDo: convert to yadm templates
curr_path=${ZDOTDIR:-~}/platform

case $(uname -s) in
  Linux)
	  DISTRO=$(awk -F'=' '/^ID=/ {print tolower($2)}' /etc/*-release 2> /dev/null)
    if [[ $DISTRO = "alpine" ]]; then
      source $curr_path/alpine.zsh

    elif [[ $DISTRO = "arch" ]]; then
      source $curr_path/arch.zsh

    fi
  ;;
  Darwin)
	  source $curr_path/mac.zsh
  ;;
esac

