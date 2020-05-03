#!/bin/sh

_dirname=$(cd $(dirname "$0") && pwd)

ask()
{
    response=y

    if [ -e "$HOME/$1" ]; then
	echo "overwrite $1? \c"
	read response
    fi

    if [ "$response" != "y" ] && [ "$response" != "n" ]; then
	response=n
    fi

    if [ "$response" = "y" ]; then
	($2 $1)
    fi
}

to_copy_home()
{
    cp "$1" "$HOME/"
}

to_install_emacs()
{
    git clone --depth=1 git@github.com:sullenor/emacs.d.git "$HOME/$1"
}

echo "setup dotfiles"
ask .editorconfig to_copy_home
ask .gitconfig to_copy_home
ask .gitignore_global to_copy_home
ask .zshrc to_copy_home
ask .zshrc_local to_copy_home
# ask .emacs.d to_install_emacs
