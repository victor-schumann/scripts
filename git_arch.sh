#!/bin/bash

# Set your Git configuration variables
git_username="Victor Macário"
git_email="2220013@gmail.com"

# Update and upgrade the system
sudo pacman -Syu --noconfirm

# Install Git and xclip
sudo pacman -S git xclip --noconfirm

# Configure Git
git config --global user.name "$git_username"
git config --global user.email "$git_email"

# Generate SSH Key
ssh-keygen -t rsa -b 4096 -C "$git_email"

# Add SSH Key to SSH Agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Copy SSH Key to Clipboard
xclip -selection clipboard < ~/.ssh/id_rsa.pub

# Prompt user to add SSH Key to GitHub manually
echo "Your SSH key has been generated and copied to the clipboard."
echo "Please go to your GitHub account settings, add a new SSH key, and paste the key there."
