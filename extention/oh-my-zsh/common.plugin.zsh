# z is the new j, yo
# https://github.com/rupa/z

# Tracks your most used directories, based on 'frecency'.

# After  a  short  learning  phase, z will take you to the most 'frecent'
# directory that matches ALL of the regexes given on the command line, in
# order.

# For example, z foo bar would match /foo/bar but not /bar/foo.
. `brew --prefix`/etc/profile.d/z.sh

# Simple shortcut for the static server
www() {
  python -m SimpleHTTPServer ${1:-8080}
}

# atom
alias a='atom -a .'
