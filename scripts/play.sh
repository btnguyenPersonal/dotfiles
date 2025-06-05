#!/bin/bash

while true; do
    # Get array of directories
    dirs=($(ls -d */))

    # Check if there are any directories
    if [ ${#dirs[@]} -eq 0 ]; then
        echo "No directories found in current path"
        exit 1
    fi

    # Select random directory
    random_dir=${dirs[$RANDOM % ${#dirs[@]}]}

    # Remove trailing slash
    random_dir=${random_dir%/}

    # Play contents with mpv
    mpv "$random_dir"/*

done
