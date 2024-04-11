#!bin/bash

case $config_choice in
  1)
    config="bare_bones"
    ;;
  2)
    config="developer"
    ;;
  3)
    config="home"
    ;;
  *)
    echo "Invalid choice, defaulting to Bare Bones"
    config="bare_bones"
    ;;
esac

export CONFIG=$config

echo "Installing dotfiles"
source install/link.sh

echo "Initializing submodule(s)"
git submodule update --init --recursive

echo "Please choose a configuration:"
echo "1) Lightweight (Essentials only)"
echo "2) Developer/Engineering Config"
echo "3) Productivity/Full Config"
read -p "Enter the number of your choice: " config_choice



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
