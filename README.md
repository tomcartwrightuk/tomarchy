# Tomarchy

A bootstrap script for setting up Arch Linux with Hyprland and a curated selection of tools.

Heavily influenced by [Omarchy](https://github.com/basecamp/omarchy).

## Features

- **One-liner install** — Fetch and run via `curl` on a fresh Arch installation
- **Hyprland** — Modern Wayland compositor with sensible defaults
- **Waybar** — Status bar with WiFi, Bluetooth, audio, and battery modules
- **WiFi** — NetworkManager with `nmtui` for easy configuration
- **Bluetooth** — Full Bluetooth stack with `bluetui` TUI manager
- **Audio** — PipeWire with volume controls via waybar
- **Battery** — Power management with `power-profiles-daemon` (great for ThinkPads)
- **Fingerprint** — Optional fingerprint authentication for sudo/polkit
- **mise** — Modern version manager for dev tools

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/tomcartwrightuk/tomarchy/main/bootstrap.sh | bash
```

## Post-Install

After rebooting into Hyprland:

```bash
# Set up fingerprint authentication (optional)
tomarchy-setup-fingerprint

# Manage power profiles
powerprofilesctl set balanced    # or: performance, power-saver
```

## Keybindings

| Key | Action |
|-----|--------|
| `Super + Return` | Open terminal (kitty) |
| `Super + D` | App launcher (wofi) |
| `Super + Q` | Close window |
| `Super + M` | Exit Hyprland |
| `Super + V` | Toggle floating |
| `Super + F` | Fullscreen |
| `Super + H/J/K/L` | Move focus (vim-style) |
| `Super + 1-0` | Switch workspace |
| `Super + Shift + 1-0` | Move window to workspace |

## Waybar

Click the icons to manage:
- **Network** — Opens `nmtui`
- **Bluetooth** — Opens `bluetui`
- **Volume** — Click to mute, scroll to adjust

## Structure

```
tomarchy/
├── bin/
│   └── tomarchy-setup-fingerprint
├── config/
│   ├── hypr/
│   │   ├── hyprland.conf
│   │   ├── autostart.conf
│   │   ├── bindings.conf
│   │   ├── input.conf
│   │   └── monitors.conf
│   └── waybar/
│       ├── config.jsonc
│       └── style.css
├── bootstrap.sh
└── README.md
```

## Requirements

- A fresh Arch Linux installation
- Internet connection (ethernet recommended, or use `iwctl` for WiFi)

## License

MIT
