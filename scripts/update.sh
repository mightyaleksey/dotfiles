#!/bin/sh

# use task list for update
# add posibility to run particular tasks

_dirname=$(dirname "$0")

cd "$_dirname"
source common

light_gray "add ~/.editorconfig"
cp ../home/.editorconfig ~/.editorconfig
light_gray "add ~/.gitconfig"
cp ../home/.gitconfig ~/.gitconfig

if [ ! -d ~/.oh-my-zsh ]; then
  red "Install oh-my-zsh first."
  light-gray "see https://github.com/robbyrussell/oh-my-zsh#basic-installation"
  exit 1
fi

omz_src=../home/.oh-my-zsh/custom/plugins
omz_dir=~/.oh-my-zsh/custom/plugins

for file in $(ls "$omz_dir"); do
  rm -rf "$omz_dir/$file"
done

for file in $(ls "$omz_src"); do
  light_gray "add ~/.oh-my-zsh/custom/plugins/$file"
  cp -r "$omz_src/$file" "$omz_dir"
done

plugins=$(ls "$omz_dir"| paste -sd ' ' -)
sed -i "" "s/plugins=(.*)/plugins=(git z $plugins)/" ~/.zshrc
