#!/bin/bash
wallpapers_folder=/home/guilherme/.config/wallpapers
random_image=`ls $wallpapers_folder| shuf -n 1`
full_path="${wallpapers_folder}/${random_image}"
wal -i $full_path
