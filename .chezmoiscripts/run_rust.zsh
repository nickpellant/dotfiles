#!/bin/zsh

source "$(chezmoi source-path)/.chezmoihelpers/gum_helpers.zsh"

gum_header "Rust"

if ! command -v rustc &> /dev/null; then
  gum_spin "Installing Rust..." "rust" \
    "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- '-y'" "Rust installed."

  source $HOME/.cargo/env
else
  gum_log "Rust is already installed." "Rust"
  gum_spin "Updating Rust..." "rust" "rustup update" "Rust updated."
fi
