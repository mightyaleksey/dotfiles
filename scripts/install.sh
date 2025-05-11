#!/bin/sh

# run the following command for install
# curl -fL "https://raw.githubusercontent.com/mightyaleksey/dotfiles/refs/heads/master/scripts/install.sh" | sh
_source="https://raw.githubusercontent.com/mightyaleksey/dotfiles/refs/heads/master/"
_files=(".zshrc" ".editorconfig" ".emacs" ".gitconfig" ".gitignore_global" ".hyper.js" ".zshrc_local")

function _install() {
  response=y

  if [ -e "$HOME/$1" ]; then
    echo "overwrite $1? \c"
    read response < /dev/tty
  fi

  if [ "$response" != "y" ] && [ "$response" != "n" ]; then
    response=n
  fi

  if [ "$response" = "y" ]; then
    curl -fsSL "${_source}home/$1" > "$HOME/$1"
  fi
}

for _file in ${_files[@]}; do
  _install $_file
done
