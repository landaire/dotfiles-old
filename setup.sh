#!/usr/bin/env bash

for file in `ls -l`; do
	if [[ "$file" =~ ^\. ]]; then
		echo "Linking $file"
		ln -s "$PWD/$file" "$PWD/../$file"
	fi
done
