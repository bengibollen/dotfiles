#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="${HOME}"
CONFIG_DIR="${HOME_DIR}/.config"

link_file() {
  local source_path="$1"
  local target_path="$2"

  mkdir -p "$(dirname "$target_path")"

  if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
    echo "ok    $target_path"
    return
  fi

  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    mv "$target_path" "${target_path}.bak"
    echo "backup $target_path -> ${target_path}.bak"
  fi

  ln -s "$source_path" "$target_path"
  echo "link  $target_path"
}

link_file "$ROOT/home/.zshrc" "$HOME_DIR/.zshrc"
link_file "$ROOT/home/.gitconfig" "$HOME_DIR/.gitconfig"
link_file "$ROOT/config/starship.toml" "$CONFIG_DIR/starship.toml"
