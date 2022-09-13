#!/bin/bash

# Prevent running with sudo
if [[ $(id -u) == 0 ]]; then
	echo "This script should not be run as root, or as a superuser"
	exit
fi

DIR=$(pwd)
WALLPAPER="0095.jpg"

# Update the system
sudo pacman -S archlinux-keyring
sudo pacman -Syyu

# Install Packages
yay -S pipewire pipewire-pulse pipewire-alsa pipewire-jack pamixer lxappearance grub-customizer bspwm sxhkd alacritty neovim vim nano micro thunar geany zsh dunst wget neofetch nitrogen polybar ranger rofi starship firefox arandr carla flatpak mcmojave-cursors wine betterlockscreen spotify cava networkmanager-dmenu-git

# Install Configs
mv DIR/.config/* "$HOME"/.config/
mv DIR/.wallpapers/* "$HOME"/.wallpapers/
mv DIR/.bashrc "$HOME"/.bashrc
mv DIR/.zshrc "$HOME"/.zshrc
mv DIR/.xinitrc "$HOME"/.xinitrc

# Betterlockscreen
betterlockscreen -u "$HOME"/.wallpapers/"$WALLPAPER"
nitrogen --set-scaled "$HOME"/.wallpapers/"$WALLPAPER" --head=0
nitrogen --set-scaled "$HOME"/.wallpapers/"$WALLPAPER" --head=1

# Music
echo "Do you want to install music production tools? (y/N) "
read instmusic
if [[ $instmusic == "y" || $instmusic == "Y" ]]; then
	yay -S yabridge yabridgectl reaper dexed calf fluidsynth avldrums.lv2 caps cardinal-lv2 dpf-plugins dragonfly-reverb drumgizmo ebumeter eq10q fabla geonkick guitarix helm-synth hydrogen liquidsfz lsp-plugins mda.lv2 ninjas2 noise-repellent qjackctl samplv1 setbfree sherlock.lv2 sonic-visualiser surge swh-lugins tap-plugins vamp-plugin-sdk wolf-shaper wolf-spectrum x42-plugins zam-plugins zynaddsubfx
	# TODO clone a repo with installers
fi

# Games
echo "Do you want to install gaming tools? (y/N) "
read instgames
if [[ $instgames == "y" || $instgames == "Y" ]]; then
	yay -S steam lutris heroic-games-launcher-bin
	wget $(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep "tag_name" | awk '{print "https://github.com/GloriousEggroll/proton-ge-custom/archive/" substr($2, 2, length($2)-3) ".tar.gz"}')
	mkdir -p "$HOME"/.steam/root/compatibilitytools.d
	tar -xf GE-Proton*.tar.gz -C ~/.steam/root/compatibilitytools.d/
fi

# Grub
echo "Do you want to install custom grub theme? (y/N) "
read instgrub
if [[ $instgrub == "y" || $instgrub == "Y" ]]; then
	git clone https://github.com/vinceliuice/grub2-themes.git "$HOME"/grub-themes
	"$HOME"/grub-themes/install.sh -b -t vimix -i white	
	sudo update-grub
	sudo grub-install
fi

# Reboot
sudo reboot

