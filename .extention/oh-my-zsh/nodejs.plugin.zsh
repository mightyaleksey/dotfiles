# Change npm's default directory to another directory
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
# 
# mkdir ~/.npm-global
# npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

# Shortcut for node_modules/.bin folder
export PATH=./node_modules/.bin:$PATH

# Shortcut for `node index.js` and `node -p <command>` depending on args
n() {
  if [ "$#" -gt 0 ]; then
    echo $1|sed -E "s/^([a-z\-]+)\./require(\"'\1'\")./"|xargs -I % node -p %
    return $?
  fi

  if [ -f "index" ] || [ -f "index.js" ]; then
    node index
    return $?
  fi

  node
}
