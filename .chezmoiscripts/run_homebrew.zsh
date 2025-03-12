#!/bin/zsh

brew update
brew bundle --global --no-upgrade
brew upgrade
brew autoremove
brew cleanup