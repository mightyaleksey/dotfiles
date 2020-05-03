# @see https://wiki.archlinux.org/index.php/zsh
# @see http://www.nparikh.org/unix/prompt.php
typeset -A prompt_colors
prompt_colors=(
  host      242
  path      blue
  delimiter 242
)

PROMPT="%F{$prompt_colors[path]}%~%f %F{$prompt_colors[delimiter]}$%f "


# history file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# history command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data


# `fn-delete` (forward delete)
# http://superuser.com/a/169930/165804
bindkey "^[[3~" delete-char

# `shift-tab` to reverse through completions menu
# http://stackoverflow.com/a/842370
bindkey '^[[Z' reverse-menu-complete


# Open new tabs in same directory
# @see https://callstack.com/blog/supercharge-your-terminal-with-zsh/
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
  function chpwd {
    printf '\e]7;%s\a' "file://$HOSTNAME${PWD// /%20}"
  }
  chpwd
fi


# list directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'


# shortcut for "node_modules/.bin" folder
export PATH=./node_modules/.bin:$PATH

# change npm's default directory to another directory
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
#
# initial setup:
# $ mkdir ~/.npm-global
# $ npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

# $ node-docs fs
function node-docs {
  # local section=${1:-all}
  # open "https://nodejs.org/docs/$(node --version)/api/$section.html"
  local section=${1}
  open "https://devdocs.io/node/$section"
}

# eval elisp code
# $ elisp <file>
# $ elisp 'string'
function elisp {
  if [ -f "$1" ]; then
    local file=$(cat "$1")
    emacs --batch --eval "$file"
  else
    emacs --batch --eval "$*"
  fi
}


if [ -f "$HOME/.zshrc_local" ]; then
  source $HOME/.zshrc_local
fi
