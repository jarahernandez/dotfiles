#!/bin/bash

set -e

echo "Installing essential build dependencies..."
sudo pacman -S --needed - < pkglist.txt

# --- Check and Install yay ---
if ! command -v yay &>/dev/null; then
    echo "yay is not installed. Installing it now..."
    # Create a temporary directory for the build
    _tempdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay-bin.git "$_tempdir"
    cd "$_tempdir"
    makepkg -si --noconfirm
    cd - > /dev/null
    rm -rf "$_tempdir"
else
    echo "yay is already installed. Skipping installation."
fi

# --- Install AUR Packages ---
echo "Installing AUR packages..."
yay -S --needed - < aur-pkglist.txt

# --- Copy Configs ---
echo "Copying main configs..."
mkdir -p ~/.config
cp -r config/* ~/.config/

# Copy shell config to home
echo "Copying shell configs..."
cp .bashrc ~/

# Copy icons (cursors) to the local icons folder
echo "Copying cursor icons..."
mkdir -p ~/.icons
cp -r icons/* ~/.icons/

echo "Done."
