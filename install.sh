#!/bin/bash 

read -p "Install ALL packages? (y/N): " choice
case "$choice" in
	y|Y)
		;;
	n|N )
		echo "Aborted"
		exit 1;;
	* )
  		echo "Aborted" 
		exit 1;;
esac


stow awww/	--adopt
stow bash/ --adopt
stow batsignal/ --adopt
stow cava/ --adopt
stow cowsay/ --adopt
stow fastfetch/ --adopt
stow fontconfig/ --adopt
stow fuzzel/ --adopt
stow gtk-3.0/ --adopt
stow hellwal/ --adopt
stow hyprland/ --adopt
stow kitty/ --adopt
stow mako/ --adopt
stow micro/ --no-fold --adopt
stow mpv/ --adopt
stow nvim/ --adopt
stow pywalfox/ --adopt
stow qt6ct/ --adopt
stow scripts/ --adopt
stow swayimg/ --adopt
stow syshud/ --adopt
stow systemd/ --no-fold --adopt
stow uwsm/ --adopt
stow wallpapers/ --adopt
stow waybar/ --adopt
stow wiremix/ --adopt
stow xdg-desktop-portal/ --adopt
stow yazi/ --adopt
