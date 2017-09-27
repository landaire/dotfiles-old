#!/usr/bin/env bash

for file in `ls`; do
	if [[ "$file" =~ ^\. ]]; then
		ln -s "$PWD/$file" "$PWD/../$file"
	fi
done
