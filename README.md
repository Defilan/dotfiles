[![Shell Lint](https://github.com/Defilan/dotfiles/actions/workflows/shell_lint.yml/badge.svg)](https://github.com/Defilan/dotfiles/actions/workflows/shell_lint.yml)
# Defilan's Dotfiles for MacOS & Debian

This repository contains an Ansible playbook for setting up a MacOS or Debian development environment. On MacOS, this installs Homebrew, Ansible, and a variety of applications and customizations. On Debian, similar configurations are made and various apt packages are installed. 

## Usage

To use this setup, clone this repository into a directory of your choice on your Mac or Debian system:

```bash
git clone https://github.com/defilan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

### Choose a desired configuration template

```bash
Please choose a configuration:
1) Lightweight (Essentials only)
2) Developer/Engineering Config
3) Productivity/Full Config
4) Quit
Enter the number of your choice:
```

### Enter your git config information if missing
```bash
Enter your git username: Your name
Enter your git email: Your email address
```

The `install.sh` script performs the following actions:

- Checks if Homebrew (on MacOS) is installed and installs it if not.
- Checks if Ansible is installed and installs it if not.
- Runs the Ansible playbook contained in this repository.

### What does the Ansible playbook do?
#### The Ansible playbook installs a variety of applications and performs some customizations to the MacOS or Debian environment. Here's a brief overview:

1. Taps into several Homebrew repositories, including HashiCorp, AWS, and Homebrew's own font cask.

#### For MacOS:

- Installs a variety of Homebrew packages, including `neovim`, `tmux`, `git-extras`, `thefuck`, `go`, `kubectl`, `skaffold`, `awscli`, `terraform`, `packer`, `aws-sam-cli`, `node`, `redis`, and `molecule`.
- Installs several Homebrew cask packages, including `arc`, `iterm2`, `visual-studio-code`, `1password`, `rectangle`, `font-hack-nerd-font`, `jetbrains-toolbox`, `nordvpn`, `switchresx`, `discord`, `istat-menus`, `signal`, `podman`, `bruno`, `gimp`, `obs`, and `krisp`.

#### For Debian:

- Installs a variety of packages using the package manager, including `neovim`, `tmux`, `git-extras`, `thefuck`, `go`, `kubectl`, `skaffold`, `awscli`, `terraform`, `packer`, `aws-sam-cli`, `node`, `redis`, and `molecule`.

2. Creates directories at `~/stuffy`, `~/stuffy/code`, and `~/stuffy/playground`.

## Notes

Please note: This configuration is specifically tailored for MacOS and Debian systems. Other operating systems are not currently supported yet.

## License
This project is licensed under the MIT License. See the LICENSE file for details.