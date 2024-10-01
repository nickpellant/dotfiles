#!/bin/zsh

source "$(chezmoi source-path)/.chezmoihelpers/gum_helpers.zsh"

brew_bundle_check() {
  gum_spin "Checking all Brewfile dependencies are present..." "homebrew" "brew bundle check --global" "All Brewfile dependencies present."
}

brew_bundle_install() {
  gum_spin "Installing homebrew Brewfile dependencies..." "homebrew" "brew bundle --global --no-upgrade" "Homebrew Brewfile dependencies installed."
}

brew_update() {
  gum_spin "Updating homebrew..." "homebrew" "brew update" "Homebrew updated."
}

brew_upgrade() {
  gum_spin "Upgrading homebrew casks and formulae..." "homebrew" "brew upgrade" "Homebrew casks and formulae upgraded."
}

brew_autoremove() {
  gum_spin "Removing unnecessary formulae..." "homebrew" "brew autoremove" "Unnecessary homebrew formulae removed."
}

brew_cleanup() {
  gum_spin "Cleaning homebrew..." "homebrew" "brew cleanup" "Homebrew cleaned."
}

brew_bundle_cleanup() {
  gum_confirm "Do you want to remove Homebrew dependencies not listed in your Brewfile?" && {
    gum_spin \
      "Removing unlisted Homebrew dependencies..." \
      "homebrew" \
      "brew bundle cleanup --file=.Brewfile --force" \
      "Homebrew dependencies not listed in your Brewfile were removed."
  } || gum_log "Unlisted Homebrew dependencies were not removed." "homebrew"
}

gum_header "Homebrew"

brew_bundle_check || brew_bundle_install

brew_update
brew_upgrade
brew_autoremove
brew_cleanup
brew_bundle_cleanup
