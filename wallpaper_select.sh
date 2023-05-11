#!/bin/bash
# Menu to select a random wallpaper

#wallpapers_folder=/home/guilherme/.config/wallpapers
#cache_folder=/home/guilherme/.cache/wal/schemes
#random_image=""
#
#if [[ $1 == "RANDOM" ]]; then
#    random_image=`ls $wallpapers_folder| shuf -n 1`
#else
#    random_image=`ls $wallpapers_folder| rofi -window-title Wallpaper -dmenu`
#fi
#
#random_image=`[ -z "$random_image" ] && echo $(ls $wallpapers_folder | shuf -n 1) || echo $random_image`
#
#image_line=`cat $wallpapers_folder/.backend | grep $random_image`
#backend_selection=` echo $image_line | awk -F: '{print $2}' | sed 's/,/\n/g' | shuf | head -n1` 
#theme_selection=` echo $image_line | awk -F: '{print $3}'`
#backend=`[ -z "$backend_selection" ] && echo " " || echo "--backend $backend_selection"`
#theme=`[ -z "$theme_selection" ] && echo " " || echo "--theme $theme_selection"`
#
#printf "Backend: $backend| Theme: $theme_selection"
#
#full_path="${wallpapers_folder}/${random_image}"
#
#printf "\nFull command wal -i $full_path $backend $theme"

#wal -i $full_path $backend $theme
# -----------------------
# -----------------------
# -----------------------
# -----------------------
# -----------------------
# -----------------------

#hex=$(xrdb -query | grep '*color*'| awk '{print $NF}' |  shuf | head -n1 | sed "s/#//")
#r=$(printf "%d" 0x${hex:0:2})
#g=$(printf "%d" 0x${hex:2:2})
#b=$(printf "%d" 0x${hex:4:2})


wallpaper_folder=/home/guilherme/.config/wallpapers
configfile=$wallpaper_folder/.backend
selected_image_or_theme=""

if [[ $1 == "RANDOM" ]]; then
    selected_image_or_theme=`shuf -n 1 $configfile`
else
    selected_image_or_theme=`cat $configfile| grep -v '^$' | awk -F: '{print $1}'| rofi -window-title Wallpaper -dmenu |  xargs -I % grep % $configfile`

fi

if [[ $selected_image_or_theme == "" ]]; then
    selected_image_or_theme=`shuf -n 1 $configfile`
fi



if [[ $selected_image_or_theme == *"json"* ]]; then
    #THEME
    wal --theme $wallpaper_folder/$selected_image_or_theme
elif [[ $selected_image_or_theme == *":"* ]]; then
    backend_selection=` echo $selected_image_or_theme | awk -F: '{print $2}' | sed 's/,/\n/g' | shuf | head -n1` 
    backend=`[ -z "$backend_selection" ] && echo " " || echo "--backend $backend_selection"`
    image_path=$wallpaper_folder/$(echo $selected_image_or_theme | awk -F: '{print $1}')

    wal -i $image_path $backend

else
    wal --theme $selected_image_or_theme
fi
