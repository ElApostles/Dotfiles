#!/bin/bash

cd ~/goinfre && mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
eval "$(homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"
brew install lazygit
brew install node@16
brew install ripgrep
brew install fzf
brew install cmake
