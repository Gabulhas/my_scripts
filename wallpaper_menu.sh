#!/bin/bash
# Menu to select a random wallpaper
wallpapers_folder=/home/guilherme/.config/wallpapers
random_image=`ls $wallpapers_folder| rofi -window-title Wallpaper -dmenu`
full_path="${wallpapers_folder}/${random_image}"
wal -i $full_path
