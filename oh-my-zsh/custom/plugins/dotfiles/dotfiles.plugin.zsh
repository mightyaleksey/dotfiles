# simple alias to execute makefile with provided arguments
dot () {
  if [ ! -d ~/.dotfiles ]; then
    printf "You don't have dotfiles installed\n"
    return 1
  fi

  origin=$(pwd)
  (cd ~/.dotfiles; make origin="$origin" $1)
  unset origin
}
