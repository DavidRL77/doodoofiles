#!/bin/sh

wallpaper_dir=~/.cache/wallpaper

swww clear
sleep 0.05
swww img $wallpaper_dir/current_wallpaper_grayscale --transition-type fade --transition-duration 1 --transition-fps 60
sleep 1
swww img $wallpaper_dir/current_wallpaper  --transition-type grow  --transition-pos top-left --transition-duration 1 --transition-fps 60
