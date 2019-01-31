dt() {
  if [ ! -d ~/.dotfiles ]; then
    echo "Install dotfiles first."
    return 1
  fi

  case "$1" in
    "up")
      ~/.dotfiles/scripts/update.sh
      ;;
    *)
      echo "$ dt <command>"
      echo
      echo "Commands:"
      echo "  up   update dotfiles"
      ;;
  esac
}
