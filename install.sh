#!bin/bash

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
        /opt/homebrew/bin/ansible-playbook defilan-macos/playbook.yml
    else
       /usr/local/Homebrew/bin/ansible-playbook defilan-macos/playbook.yml    
    fi    
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

echo "Done."
