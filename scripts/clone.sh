#!/bin/bash

# Configuration
GITHUB_USER="btnguyenPersonal"  # Replace with your GitHub username
GITHUB_TOKEN="$1"    # Replace with your GitHub Personal Access Token
REPO_DIR="$HOME/repos"       # Directory to store cloned repositories
API_URL="https://api.github.com/user/repos"

# Create repo directory if it doesn't exist
mkdir -p "$REPO_DIR"

# Fetch all repositories (public and private) using GitHub API
repos=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "$API_URL?per_page=100" | jq -r '.[].clone_url')

# Check if curl or jq failed
if [ $? -ne 0 ]; then
    echo "Error fetching repositories from GitHub API"
    exit 1
fi

# Clone new repositories
for repo in $repos; do
    repo_name=$(basename "$repo" .git)
    repo_path="$REPO_DIR/$repo_name"

    # Modify clone URL to include PAT
    auth_repo_url=$(echo "$repo" | sed "s|https://|https://$GITHUB_TOKEN@|")

    # Check if repository already exists
    if [ ! -d "$repo_path" ]; then
        echo "Cloning $repo_name..."
        git clone "$auth_repo_url" "$repo_path"
        if [ $? -eq 0 ]; then
            echo "Successfully cloned $repo_name"
        else
            echo "Failed to clone $repo_name"
        fi
    else
        echo "$repo_name already exists, skipping clone"
    fi
done