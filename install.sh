#!bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

# source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
