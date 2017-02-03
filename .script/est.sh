#!/bin/sh

# Embedded STring
#
# Possibility to replace ${x} variables with provided values in stream. Example:
# echo '${greeting}'|est.sh greeting='hello, dude!'

pairs=""
for pair in "$@"; do
  f1=$(echo $pair|cut -d= -f1)
  f2=$(echo $pair|cut -d= -f2)

  pairs="$pairs -e 's/\\\${$f1}/$f2/g'"
done

eval sed "-E $pairs"</dev/stdin
