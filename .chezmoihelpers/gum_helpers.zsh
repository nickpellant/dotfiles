#!/bin/zsh

gum_spin() {
  local title="$1"
  local prefix="$2"
  local command="$3"
  local log_message="$4"

  gum spin \
    --show-error \
    --title "$title" \
    -- $command

  gum_log "$log_message" "$prefix"
}

gum_log() {
  local log_message="$1"
  local prefix="$2"

  gum log \
    --structured \
    --prefix "$prefix" \
    --level info "$log_message"
}

gum_confirm() {
  local prompt_message="$1"

  gum confirm "$prompt_message"
}

gum_header() {
  local header="$1"

  gum style --border normal "$header"
}
