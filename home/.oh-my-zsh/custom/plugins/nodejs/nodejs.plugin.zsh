# shortcut for "node_modules/.bin" folder
export PATH=./node_modules/.bin:$PATH

# change npm's default directory to another directory
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
#
# initial setup:
# $ mkdir ~/.npm-global
# $ npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
