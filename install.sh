#!/usr/bin/env bash
# Display ASCII art
cat << "EOF"
   ___      ____ __         _        ___       __  ____ __      
  / _ \___ / _(_) /__ ____ ( )___   / _ \___  / /_/ _(_) /__ ___
 / // / -_) _/ / / _ `/ _ \|/(_-<  / // / _ \/ __/ _/ / / -_|_-<
/____/\__/_//_/_/\_,_/_//_/ /___/ /____/\___/\__/_//_/_/\__/___/                                                                      
EOF
echo "Please choose a configuration:"
echo "1) Lightweight (Essentials only)"
echo "2) Developer/Engineering Config"
echo "3) Productivity/Full Config"
echo "4) Quit"
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
  4)
    exit 0
    ;;
  *)
    echo "Invalid choice, defaulting to Bare Bones"
    configtemplate="lightweight"
    ;;
esac

export CONFIG=$configtemplate
echo "You chose this configuration: $config_choice ($configtemplate)"

echo "Configuring Git"
source install/git.sh

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
