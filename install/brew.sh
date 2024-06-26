#!/usr/bin/env bash

echo "Checking/Installing Homebrew..."
install=0
if [ "$(uname -m)" = 'arm64' ]; then
    echo "Apple Silicon"
    if [ ! -d "/opt/homebrew" ]; then
        install=1
    fi
else
    echo "Intel"
    if [ ! -d "/usr/local/Homebrew" ]; then
        install=1
    fi
fi
if [ "$install" = "1" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi