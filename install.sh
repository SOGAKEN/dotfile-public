#!/bin/bash

# dotfilesディレクトリのパス (必要に応じて変更してください)
DOTFILES_DIR="$HOME/dotfiles-public"

# .configディレクトリのシンボリックリンクを作成する関数
create_config_symlink() {
  local source_dir="$DOTFILES_DIR/.config/$1"
  local target_dir="$HOME/.config/$1"

  # ターゲットディレクトリが存在せず、ソースディレクトリが存在する場合のみ処理
  if [ ! -d "$target_dir" ] && [ -d "$source_dir" ]; then
    echo "Creating symlink: $target_dir -> $source_dir"
    ln -s "$source_dir" "$target_dir"
  elif [ -d "$target_dir" ]; then
    echo "Warning: Destination directory already exists: $target_dir"
  else
    echo "Warning: Source directory does not exist: $source_dir"
  fi
}

# .configディレクトリ内の各ディレクトリに対してシンボリックリンクを作成
for dir in "$DOTFILES_DIR"/.config/*; do
  if [ -d "$dir" ]; then
    create_config_symlink "$(basename "$dir")"
  fi
done

echo "Symlink creation completed (or warnings displayed)."
