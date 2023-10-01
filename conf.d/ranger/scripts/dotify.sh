#!/bin/env bash

# File              : conf.d/ranger/scripts/dotify.sh
# Author            : Jeff Lance <email@jefflance.me>
# Date              : 01.10.2023 19:06:09
# Last Modified Date: 01.10.2023 19:06:09
# Last Modified By  : Jeff Lance <email@jefflance.me>
#
# Script that alter visibility of a set of selected files.
# It renames files prefixing a dot in the name.



for path in "$@"; do
    file_name="$(basename "$path")"
    dir_name="$(dirname "$path")"
    case "$file_name" in .*)
        mv -v -- "$path" "$dir_name/${file_name#.}"
        ;;
    *)
        mv -v -- "$path" "$dir_name/.$file_name"
        ;;
    esac
done

printf "Press ENTER to continue"
read -r
