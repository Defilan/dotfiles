#!/usr/bin/env bash

echo "Please choose a configuration:"
echo "1) Lightweight (Essentials only)"
echo "2) Developer/Engineering Config"
echo "3) Productivity/Full Config"
read -rp "Enter the number of your choice: " config_choice

case $config_choice in
  1)
    configtemplate="lightweight"
    ;;
  2)
    configtemplate="developer"
    ;;
  3)
    configtemplate="home"
    ;;
  *)
    echo "Invalid choice, defaulting to Bare Bones"
    configtemplate="lightweight"
    ;;
esac

export CONFIG=$configtemplate
echo "You chose this configuration: $config_choice ($configtemplate)"

# Prompt the user for their git username and email
read -rp "Enter your git username: " git_username
read -rp "Enter your git email: " git_email

# Replace the placeholders in the gitconfig file with the user's git username and email
sed -e "s/GIT_USERNAME/$git_username/g" -e "s/GIT_EMAIL/$git_email/g" git/gitconfig.symlink.template > git/gitconfig.symlink

echo "Installing dotfiles"
source install/link.sh

echo "Initializing submodule(s)"
git submodule update --init --recursive

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"
    source install/brew.sh
    echo "Install Ansible..."
    if [[ $(uname -m) == 'arm64' ]]; then
        /opt/homebrew/bin/brew install ansible
    else
       /usr/local/Homebrew/bin/brew install ansible     
    fi
    echo "Configuring Mac..."
     if [[ $(uname -m) == 'arm64' ]]; then
        /opt/homebrew/bin/ansible-playbook defilan-macos/playbook.yml -e "config=$configtemplate"
    else
       /usr/local/Homebrew/bin/ansible-playbook defilan-macos/playbook.yml -e "config=$configtemplate"
    fi    
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

echo "Done."
