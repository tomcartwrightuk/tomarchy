#!/bin/bash
set -e

# Tomarchy Bootstrap Script
# Fetches and sets up a fresh Arch Linux installation with Hyprland

echo "==> Starting Tomarchy bootstrap..."

# Update system packages
echo "==> Upgrading system packages..."
sudo pacman -Syu --noconfirm

# Install git
echo "==> Installing git..."
sudo pacman -S --noconfirm --needed git

# Install wifi tools (NetworkManager is the standard choice for Hyprland setups)
echo "==> Installing and configuring wifi tools..."
sudo pacman -S --noconfirm --needed networkmanager
sudo systemctl enable --now NetworkManager

# Install Hyprland and essential packages
echo "==> Installing Hyprland and dependencies..."
sudo pacman -S --noconfirm --needed \
    hyprland \
    xdg-desktop-portal-hyprland \
    kitty \
    waybar \
    wofi \
    polkit-kde-agent \
    qt5-wayland \
    qt6-wayland \
    pipewire \
    pipewire-pulse \
    wireplumber

echo "==> Tomarchy bootstrap complete!"
echo "    - System packages upgraded"
echo "    - Git installed"
echo "    - NetworkManager installed and enabled (use 'nmtui' to configure wifi)"
echo "    - Hyprland and essential packages installed"
echo ""
echo "You can start Hyprland by running 'Hyprland' from a TTY."
