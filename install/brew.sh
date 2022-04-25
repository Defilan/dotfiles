#!/bin/sh

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

