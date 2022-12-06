#!/bin/bash
# Menu to select a random wallpaper
wallpapers_folder=/home/guilherme/.config/wallpapers
cache_folder=/home/guilherme/.cache/wal/schemes
random_image_select_exp="ls $wallpapers_folder| shuf -n 1"
random_image=""

if [[ $1 == "RANDOM" ]]; then
    random_image=`ls $wallpapers_folder| shuf -n 1`
else
    random_image=`ls $wallpapers_folder| rofi -window-title Wallpaper -dmenu`
fi

random_image=`[ -z "$random_image" ] && echo $(ls $wallpapers_folder | shuf -n 1) || echo $random_image`

image_line=`cat $wallpapers_folder/.backend | grep $random_image`
backend_selection=` echo $image_line | awk -F: '{print $2}' | sed 's/,/\n/g' | shuf | head -n1` 
theme_selection=` echo $image_line | awk -F: '{print $3}'`
backend=`[ -z "$backend_selection" ] && echo " " || echo "--backend $backend_selection"`
theme=`[ -z "$theme_selection" ] && echo " " || echo "--theme $theme_selection"`

printf "Backend: $backend| Theme: $theme_selection"

full_path="${wallpapers_folder}/${random_image}"

printf "\nFull command wal -i $full_path $backend $theme"

wal -i $full_path $backend $theme
# -----------------------

#hex=$(xrdb -query | grep '*color4'| awk '{print $nf}' | head -n1  | sed "s/#//")
hex=$(xrdb -query | grep '*color*'| awk '{print $NF}' |  shuf | head -n1 | sed "s/#//")
r=$(printf "%d" 0x${hex:0:2})
g=$(printf "%d" 0x${hex:2:2})
b=$(printf "%d" 0x${hex:4:2})

# Increased saturation
#n_rgb=$(python -c "import colorsys;h,s,v=colorsys.rgb_to_hsv($r,$g,$b);r,g,b=colorsys.hsv_to_rgb(h, 1.25*s, v);print(int(r),int(g),int(b))")
#
#r=$(printf "%d" 0x${n_rgb:0:2})
#g=$(printf "%d" 0x${n_rgb:2:2})
#b=$(printf "%d" 0x${n_rgb:4:2})
#echo $r $g $b

#miiocli yeelight --ip 192.168.1.99 --token e720f3b2eb5ae315f9624348a352f136 set_rgb $r $g $b
