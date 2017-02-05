#!/bin/sh

# colors
COLOR_NC='\033[0m'
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_LIGHT_GRAY='\033[0;37m'
COLOR_BOLD='\033[1m'

omzh_dir=~/.oh-my-zsh

# plugin_file -> plugin_name
update_plugin() {
  mkdir -p ${omzh_dir}/custom/plugins/${2}
  cp ".extention/oh-my-zsh/${1}" "${omzh_dir}/custom/plugins/${2}/${1}"

  echo "${COLOR_LIGHT_GRAY}~/.oh-my-zsh/custom/plugins/${2}/${1} ${COLOR_GREEN}done${COLOR_NC}"
}

if [ -d "$omzh_dir" ]; then
  echo 'updating oh-my-zsh plugins'

  for plugin_file in `ls .extention/oh-my-zsh`; do
    plugin_name=`echo $plugin_file|cut -d. -f1`
    update_plugin $plugin_file $plugin_name
  done
else
  echo "updating oh-my-zsh plugins ${COLOR_BOLD}skipped${COLOR_NC}"
  echo "${COLOR_LIGHT_GRAY}oh-my-zsh was not found${COLOR_NC}"
fi


st_dir=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

update_package() {
  cp ".extention/sublime-text/${1}" "${st_dir}/${1}"

  echo "${COLOR_LIGHT_GRAY}Packages/User/${1} ${COLOR_GREEN}done${COLOR_NC}"
}

if [ -d "$st_dir" ]; then
  echo 'updating sublime text packages'

  for package_file in `ls .extention/sublime-text`; do
    update_package $package_file
  done
else
  echo "updating sublime text ${COLOR_BOLD}skipped${COLOR_NC}"
  echo "${COLOR_LIGHT_GRAY}sublime text was not found${COLOR_NC}"
fi
