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

# Update system
echo "Updating system..."
pacman -Syu --noconfirm

# Install pacman packages
echo "Installing pacman packages..."
pacman -S --noconfirm \
#System Tools:
  zsh \
  zsh-syntax-highlighting \
  base-devel \
  man \
  curl \
  git \
#
#Appearance
  lxappearance \
  feh \
  dunst \
  picom \
  rofi \
  rofi-calc \
  fastfetch \
  arandr \
#
#Creativity tools:
  gimp \
  kdenlive \
  ardour \
#
#Media
  vlc \
  strawberry \
#
#Development
  qt5-base \
  qt5-tools \
  qt5ct \
  qt6-base \
  qt6-tools \
  qt6ct \
  jdk-openjk \
  jre8-openjdk \
#
#Utilities
  nvim \
  alacritty \
  veracrypt \
  zathura \
  zathura-pdf-mupdf \
  imv \
  pcmanfm \
#
#Audio
  pipewire \
  pipewire-pulse \
  pipewire-jack \
  wireplumber \
#
#Communication
  discord \
  telegram-desktop \
  #
#Gaming
  steam \
  lutris \
#
#File sharing
  qbittorrent \
  nicotine+ \
#
#Miscellaneous
  cava \
  figlet \
  lolcat \
  cowsay \
  fortune-mod \
#
#Extra optional Desktop enviroment
#  xfce4 \

# Install yay packages
echo "Installing yay from the aur..."
pacman -S --noconfirm yay

echo "Installing yay packages..."
yay -S --noconfirm \
#Development
  qt5gtk2 \
  qt6gtk2 \
#
#System tools
  htop-vim \
#
#Web
  foorp-bin \
  brave-bin \
#
#Gaming
  heroic-games-launcher-bin \
#
#Miscellaneous
  cbonsai \

# Compile dwm and slstatus
echo "Compiling dwm..."
cd "$HOME/.config/suckless/dwm" || { echo "Failed to navigate to dwm directory"; exit 1; }
make clean install || { echo "Failed to build dwm"; exit 1; }

echo "Compiling slstatus..."
cd "$HOME/.config/suckless/slstatus" || { echo "Failed to navigate to slstatus directory"; exit 1; }
make clean install || { echo "Failed to build slstatus"; exit 1; }

echo "Installation script completed successfully!"
