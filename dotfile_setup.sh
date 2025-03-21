#!/bin/bash

set -e

printf '.%.0s' $(seq 1 $(tput cols))
echo

trap 'printf ".%.0s" $(seq 1 $(tput cols))' EXIT

if [[ "$OSTYPE" == "darwin"* ]]; then
  if command -v stow &>/dev/null; then
    echo "Stow is installed"
  else
    echo "Installing stow"
    brew install stow
  fi
fi

git clone https://github.com/brady-bates/dotfiles/blob/main/.bashrc ~/dotfiles/

stow --adopt -d ~/dotfiles/ -t ~/ .

echo "Dotfiles are cloned and stowed. Conflicts can be found at ~/dotfiles/"
exit 0
