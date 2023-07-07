#!/bin/bash

# Path
BREW_DIR="$HOME/goinfre/.brew"
ZSHRC_PATH="$HOME/.zshrc"
SKIP_FILE="$HOME/goinfre/.skip_brew_install"

# Color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'

# Check if Homebrew is already installed in the desired location
if [ -d "$BREW_DIR" ]; then
  echo "Homebrew already installed in goinfre."
  exit 0
fi

# Check if the skip file exists
if [ -f "$SKIP_FILE" ]; then
    exit 0
fi

read -p "Do you want to install Homebrew in goinfre? (y/n): " choice

if [[ $choice == "y" || $choice == "Y" ]]; then

  # Remove existing .brew directory if it exists
  echo -e "${YELLOW}Installing Homebrew...${RESET}"
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

  echo -e "${BLUE}Homebrew installed successfully!${RESET}"
elif [[ $choice == "n" || $choice == "N" ]]; then
    echo -e "${YELLOW}Skip Homebrew installation.${RESET}"
    touch ${SKIP_FILE}
else
    echo -e "${RED}Invalid choice. Please enter 'y' or 'n'.${RESET}"
fi