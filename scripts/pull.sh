#!/bin/bash

# Configuration
GITHUB_USER="btnguyenPersonal"  # Replace with your GitHub username
GITHUB_TOKEN="$1"    # Replace with your GitHub Personal Access Token
REPO_DIR="$HOME/repos"       # Directory containing cloned repositories

# Check if repo directory exists
if [ ! -d "$REPO_DIR" ]; then
    echo "Repository directory $REPO_DIR does not exist"
    exit 1
fi

# Iterate through all directories in REPO_DIR
for repo_path in "$REPO_DIR"/*; do
    if [ -d "$repo_path/.git" ]; then
        repo_name=$(basename "$repo_path")
        echo "Updating $repo_name..."
        cd "$repo_path" || continue

        # Set remote URL with PAT for authentication
        git remote set-url origin "https://$GITHUB_TOKEN@github.com/$GITHUB_USER/$repo_name.git"
        git pull
        if [ $? -eq 0 ]; then
            echo "Successfully updated $repo_name"
        else
            echo "Failed to update $repo_name"
        fi
        cd - >/dev/null
    fi
done
