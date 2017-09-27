#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SUBLIME_PATH="$HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User"

echo "Initializing submodules..."
echo ""

git submodule init
git submodule update

echo ""
echo "Adding dotfiles"

for file in `ls -l`; do
	if [[ "$file" =~ ^\. ]]; then
		echo "Linking $file"
		ln -s "$PWD/$file" "$PWD/../$file"
	fi
done

echo ""
echo "Adding application-specific links..."

rm -rf $SUBLIME_PATH
ln -s "$PWD/Sublime/User" "$SUBLIME_PATH/User"

echo ""
echo "Done!"
