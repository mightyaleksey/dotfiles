#!/bin/sh

rm -rf ~/.emacs.d
mkdir -p ~/.emacs.d
curl https://raw.githubusercontent.com/sullenor/dotfiles/master/home/.emacs.d/init.el -o ~/.emacs.d/init.el
