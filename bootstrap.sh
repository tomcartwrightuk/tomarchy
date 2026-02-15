#!/bin/bash
set -e

# Tomarchy Bootstrap Script
# Fetches and sets up a fresh Arch Linux installation with Hyprland

# Define Tomarchy location (where the repo is cloned)
TOMARCHY_PATH="${TOMARCHY_PATH:-$HOME/.local/share/tomarchy}"

echo "==> Starting Tomarchy bootstrap..."

# Clone Tomarchy repo if not already present
if [[ ! -d "$TOMARCHY_PATH" ]]; then
  echo "==> Cloning Tomarchy..."
  git clone https://github.com/tomcartwrightuk/tomarchy.git "$TOMARCHY_PATH"
fi

# Update system packages
echo "==> Upgrading system packages..."
sudo pacman -Syu --noconfirm

# Install git
echo "==> Installing git..."
sudo pacman -S --noconfirm --needed git

# Install mise (version manager for dev tools)
echo "==> Installing mise..."
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc

# Install wifi tools (NetworkManager)
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
    polkit-gnome \
    pipewire \
    pipewire-pulse \
    wireplumber \
    pamixer \
    ttf-jetbrains-mono \
    ttf-nerd-fonts-symbols

# Copy Tomarchy config files to ~/.config
echo "==> Installing Tomarchy config files..."
cp -rn "$TOMARCHY_PATH/config/"* ~/.config/

# Configure Hyprland to start automatically on TTY1 login
echo "==> Configuring automatic Hyprland start on login..."
if ! grep -q "Hyprland" ~/.bash_profile 2>/dev/null; then
    cat >> ~/.bash_profile << 'EOF'

# Start Hyprland automatically on TTY1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec Hyprland
fi
EOF
fi

echo "==> Tomarchy bootstrap complete!"
echo "    - System packages upgraded"
echo "    - Git installed"
echo "    - mise installed (restart shell or run 'source ~/.bashrc')"
echo "    - NetworkManager installed (click network icon in waybar or run 'nmtui')"
echo "    - Hyprland and waybar installed and configured to autostart"
echo "    - Config files installed to ~/.config/"
echo ""
echo "Reboot or log out and back in to TTY1 to start Hyprland automatically."
