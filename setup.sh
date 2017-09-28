#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

APPLICATION_SUPPORT="$HOME/Library/Application Support"
SUBLIME_PATH="$APPLICATION_SUPPORT/Sublime Text 3/Packages/User"
HEX_EDITOR="$APPLICATION_SUPPORT/SweetScape/010 Editor"
LITTLE_SNITCH="$APPLICATION_SUPPORT/SweetScape/Little Snitch"
BREW_PACKAGES=(zsh ripgrep python3 fzf vim ccat)
BREW_CASK_PACKAGES=(gpgtools)

echo "Initializing submodules..."
echo ""

git submodule init
git submodule update

if ! [[ -x /usr/local/bin/brew ]]; then
	echo ""
	echo "Installing homebrew"

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo ""
	echo "Skipping homebrew -- already installed"
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
		ln -s "$PWD/$file" "$HOME/$file"
	fi
done

echo ""
echo "Adding application-specific links..."

printf "Sublime..."
rm -rf "$SUBLIME_PATH"
ln -s "$PWD/Sublime/User" "$SUBLIME_PATH/User"
echo " done!"

printf "010 Editor..."
for file in `ls 010Editor`; do
	ln -s "$PWD/010Editor/$file" "$HEX_EDITOR/$file"
done
echo " done!"

printf "Little Snitch..."
for file in `ls LittleSnitch`; do
	ln -s "$PWD/LittleSnitch/$file" "$LITTLE_SNITCH/$file"
done
echo " done!"

echo ""
echo "Finished"
