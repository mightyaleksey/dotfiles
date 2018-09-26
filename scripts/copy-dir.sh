#!/bin/sh

# Usage
#
# copy-dir.sh <src-dir> <dst-dir>
source scripts/color.sh

src=$1
dst=${2:-~}

echo "> copy-dir.sh $src $dst"

for file in $(ls -A $src); do
    light_gray "$file -> $dst/$file"

    if [ -e "$dst/$file" ]; then
        rm -rf "$dst/$file"
    fi

    cp -r "$src/$file" "$dst/$file"
done
