#!/bin/bash

BREW_DIR="$HOME/goinfre/.brew"
ZSHRC_PATH="$HOME/.zshrc"

# Check if Homebrew is already installed in the desired location
if [ -d "$BREW_DIR" ]; then
  echo "Done. Homebrew already installed in goinfre"
  exit 0
fi

# Remove existing .brew directory if it exists
if [ -d "$HOME/.brew" ]; then
  rm -rf "$HOME/.brew"
fi

# Clone Homebrew repository to the desired location
git clone https://github.com/Homebrew/brew "$BREW_DIR"

# Add Homebrew to the PATH and source .zshrc
echo "export PATH=$BREW_DIR/bin:$PATH" >> "$ZSHRC_PATH"
source "$ZSHRC_PATH"

# Update Homebrew
brew update

# Install packages
brew install node
brew install postgresql@14

echo "Done. Homebrew successfully installed in goinfre"

