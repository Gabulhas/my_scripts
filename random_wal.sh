#!/bin/bash
# Script to select a wallpaper at random
# Used with crontab to change wallpaper every 30min
wallpapers_folder=/home/guilherme/.config/wallpapers
random_image=`ls $wallpapers_folder| shuf -n 1`
backend_selection=`cat $wallpapers_folder/.backend | grep $random_image | sed 's/.*://'` # do something to select random backend
full_path="${wallpapers_folder}/${random_image}"
