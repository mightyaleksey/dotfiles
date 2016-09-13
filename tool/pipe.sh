#!/bin/sh

# small helper to copy package.json file
#
# source file $1
# destination folder $2

destination="$2/$(basename $1)"
if [ -f $2/$(basename $1) ]; then
  echo "$destination not overwritten"
else
  cat $1|tool/est.sh name="$(basename $2)">$2/$(basename $1)
  echo "$1 -> $destination"
fi
