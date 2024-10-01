#!/bin/zsh

source "$(chezmoi source-path)/.chezmoihelpers/gum_helpers.zsh"

asdf_plugin_add_or_update() {
  local plugin="$1"
  if ! asdf plugin list | grep -q "^$plugin\$"; then
    gum_spin "Adding asdf plugin $plugin..." "asdf" "asdf plugin add $plugin" "asdf plugin $plugin added."
  else
    gum_spin "Updating asdf plugin $plugin..." "asdf" "asdf plugin update $plugin" "asdf plugin $plugin updated."
  fi
}

asdf_install_latest_version() {
  local plugin="$1"
  local latest_version
  latest_version=$(asdf latest $plugin)
  if ! asdf list $plugin | grep -q "^$latest_version\$"; then
    gum_spin "Installing latest version ($latest_version) of $plugin..." "asdf" "asdf install $plugin latest" "$plugin version $latest_version installed."
    gum_spin "Setting global version of $plugin to $latest_version..." "asdf" "asdf global $plugin latest" "$plugin global version set to $latest_version."
  fi
}

asdf_setup_nodejs() {
  asdf_plugin_add_or_update "nodejs"
  export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_available
  gum_spin "Installing Node.js LTS version..." "asdf" "asdf install nodejs lts" "Node.js LTS version installed."
  gum_spin "Setting global Node.js version to LTS..." "asdf" "asdf global nodejs lts" "Node.js global version set to LTS."
}

gum_header "ASDF"

declare -a plugins=("ruby" "python")

for plugin in "${plugins[@]}"; do
  asdf_plugin_add_or_update "$plugin"
  asdf_install_latest_version "$plugin"
done

asdf_setup_nodejs
