#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SUBLIME_PATH="$HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User"
BREW_PACKAGES=(zsh ripgrep python3 fzf)
BREW_CASK_PACKAGES=(gpgtools)

echo "Initializing submodules..."
echo ""

git submodule init
git submodule update

if ! [[ -x /usr/local/bin/brew ]]; then
	echo ""
	echo "Installing homebrew"

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! [[ -x /usr/local/bin/brew ]]; then
	echo ""
	echo "Installing homebrew"

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo ""
echo "Installing brew formulae..."

for package in $BREW_PACKAGES; do
	brew install "$package"
done;

echo ""
echo "Installing brew casks..."
for package in $BREW_CASK_PACKAGES; do
	brew cask install "$package"
done;

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
