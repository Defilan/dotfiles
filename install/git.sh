#!/usr/bin/env bash

# Check if user.name and user.email are set in the existing gitconfig
git_username=$(git config --get user.name)
git_email=$(git config --get user.email)
echo $git_username


# If user.name or user.email are not set, prompt the user for their git username and email
if [[ -z $git_username ]]; then
    read -rp "Enter your git username: " git_username
fi
if [[ -z $git_email ]]; then
    read -rp "Enter your git email: " git_email
fi

# Replace the placeholders in the gitconfig file with the user's git username and email
sed -e "s/GIT_USERNAME/$git_username/g" -e "s/GIT_EMAIL/$git_email/g" git/gitconfig.symlink.template > git/gitconfig.symlink