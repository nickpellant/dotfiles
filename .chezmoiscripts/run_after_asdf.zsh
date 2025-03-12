#!/bin/zsh

asdf_plugin_add_or_update() {
  local plugin="$1"
  if ! asdf plugin list | grep -q "^$plugin\$"; then
    asdf plugin add $plugin
  else
    asdf plugin update $plugin
  fi
}

asdf_install_latest_version() {
  local plugin="$1"
  local latest_version
  latest_version=$(asdf latest $plugin)
  if ! asdf list $plugin | grep -q "^$latest_version\$"; then
    asdf install $plugin latest
    asdf global $plugin latest
  fi
}

declare -a plugins=("python" "ruby")

for plugin in "${plugins[@]}"; do
  asdf_plugin_add_or_update "$plugin"
  asdf_install_latest_version "$plugin"
done
