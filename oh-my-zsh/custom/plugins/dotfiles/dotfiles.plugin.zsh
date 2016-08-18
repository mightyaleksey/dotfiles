# simple alias to execute makefile with provided arguments
dot () {
  if [ ! -d ~/.dotfiles ]; then
    printf "You don't have dotfiles installed\n"
    return 1
  fi

  (cd ~/.dotfiles; make $1)
  return $?
}
