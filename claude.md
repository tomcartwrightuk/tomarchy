# Arch linux setup called Tomarchy

I have installed a fresh installation of Arch linux and I want to bootstrap it with all the tools and visual details that suit my setup but I would like to have a better idea on how to upgrade aspects of the system.
This project is heavily influenced by Omarchy which you can find as a submodule in this folder.

## Requirements

The system should
- Be a bash script that can be fetched and evaluated via curl on the target machine
- It should upgrade basic arch packages (via pacman -Syu)
- Install the packages listed below
- Add setup scripts to the startup services
- Copies the config files into place

## Installed packages

- hyprland
- git
- mise
- waybar
- wifi, bluetooth and sound applets for waybar
- authenication with fingerprint support
- battery management support especially for a Thinkpad X1

## Services to run on startup
- Run on startup:
    - hyprland
    - waybar
