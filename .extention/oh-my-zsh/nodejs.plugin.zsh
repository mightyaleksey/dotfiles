# Change npm's default directory to another directory
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
# 
# mkdir ~/.npm-global
# npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

# Shortcut for node_modules/.bin folder
export PATH=./node_modules/.bin:$PATH
