#!/bin/sh

path=$(pwd)

# List of files and directories to copy
items=(
    ".config"
    ".fonts"
    ".icons"
    ".local"
    ".themes"
    "pic"
    ".aliasrc"
    ".envrc"
    ".screen.sh"
    ".xinitrc"
    ".zprofile"
    ".zshrc"
)

for item in "${items[@]}"; do
    if [ -d "$path/$item" ]; then
        echo "Copying directory $item to $HOME..."
        cp -fr "$path/$item/" "$HOME/"
    elif [ -f "$path/$item" ]; then
        echo "Copying file $item to $HOME..."
        cp -f "$path/$item" "$HOME/"
    else
        echo "Skipping $item: Not found or not a valid file/directory."
    fi
done
