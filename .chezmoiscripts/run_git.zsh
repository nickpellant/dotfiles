#!/bin/zsh

source "$(chezmoi source-path)/.chezmoihelpers/gum_helpers.zsh"

gum_header "Git"

gum_spin "Updating git workspaces..." "git" "git workspace update" "Git workspaces updated."
gum_spin "Archiving git repositories..." "git" "git workspace archive" "Git repositories archived."
