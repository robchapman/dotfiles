#!/bin/bash
command -v brew >/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install stow
brew bundle --file=~/Dev/dotfiles/Brewfile

cd ~/Dev/dotfiles
for pkg in nvim tmux starship git shell ghostty aerospace; do
    stow -v --target="$HOME" "$pkg"
done
