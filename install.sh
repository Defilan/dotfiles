#!bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

# source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Checking/Installing Homebrew..."
    install=0
    if [[ $(uname -m) == 'arm64' ]]; then
        echo "M1"
        if [ ! -d "/opt/homebrew" ]; then
            install=1
        fi
    else
        echo "Intel"
        if [ ! -d "/usr/local" ]; then
            install=1
        fi
    fi
    if [ "$install" == "1" ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    echo "Install Ansible..."
    brew install ansible
    echo "Configuring Mac..."
    ansible-playbook defilan-macos/playbook.yml
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp




echo "Configuring zsh as default shell"
#chsh -s $(which zsh)

echo "Done."
