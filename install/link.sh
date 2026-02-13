#!/usr/bin/env bash

DOTFILES="$HOME/.dotfiles"

printf "\nCreating symlinks\n"
printf "==============================\n"
linkables=$(find -H "$DOTFILES" -maxdepth 3 -name '*.symlink')
for file in $linkables ; do
    target="$HOME/.$(basename "$file" '.symlink')"
    if [ -e "$target" ]; then
        printf "~%s already exists... Skipping.\n" "${target#"$HOME"}"
    else
        printf "Creating symlink for %s\n" "$file"
        ln -s "$file" "$target"
    fi
done

printf "\n\ninstalling to ~/.config\n"
printf "==============================\n"
if [ ! -d "$HOME/.config" ]; then
    printf "Creating ~/.config\n"
    mkdir -p "$HOME/.config"
fi
for config in "$DOTFILES/config/"*; do
    target="$HOME/.config/$(basename "$config")"
    if [ -e "$target" ]; then
        printf "~%s already exists... Skipping.\n" "${target#"$HOME"}"
    else
        printf "Creating symlink for %s\n" "$config"
        ln -s "$config" "$target"
    fi
done

printf "\n\nCreating vim symlinks\n"
printf "==============================\n"

vimfiles_keys=(~/.vim ~/.vimrc)
vimfiles_values=("$DOTFILES/config/nvim" "$DOTFILES/config/nvim/init.vim")

for index in "${!vimfiles_keys[@]}"; do
    file="${vimfiles_keys[index]}"
    value="${vimfiles_values[index]}"
    if [ -e "$file" ]; then
        printf "%s already exists... skipping\n" "$file"
    else
        printf "Creating symlink for %s\n" "$file"
        ln -s "$value" "$file"
    fi
done