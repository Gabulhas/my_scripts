#!/bin/bash
# Menu to select a random wallpaper
wallpapers_folder=/home/guilherme/.config/wallpapers
cache_folder=/home/guilherme/.cache/wal/schemes
random_image=""


if [[ $1 == "RANDOM" ]]; then
    random_image=`ls $wallpapers_folder| shuf -n 1`
else
    random_image=`ls $wallpapers_folder| rofi -window-title Wallpaper -dmenu`
fi


full_path="${wallpapers_folder}/${random_image}"
wal -i $full_path
wpg -s $full_path
