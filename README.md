# Defilan's Dotfiles for MacOS

This repository contains an Ansible playbook for setting up a MacOS development environment. It installs Homebrew, Ansible, and a variety of applications and customizations.

## Usage

To use this setup, clone this repository into a directory of your choice on your Mac:

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
Enter the number of your choice:
```

### Enter your git config information
```bash
Enter your git username: Your name
Enter your git email: Your email address
```

The `install.sh` script performs the following actions:

- Checks if Homebrew is installed and installs it if not.
- Checks if Ansible is installed and installs it if not.
- Runs the Ansible playbook contained in this repository.

### What does the Ansible playbook do?
#### The Ansible playbook installs a variety of applications and performs some customizations to the MacOS environment. Here's a brief overview:

1. Taps into several Homebrew repositories, including HashiCorp, AWS, and Homebrew's own font cask.
2. Installs a variety of Homebrew packages, including `neovim`, `tmux`, `git-extras`, `thefuck`, `go`, `kubectl`, `skaffold`, `awscli`, `terraform`, `packer`, `aws-sam-cli`, `node`, `redis`, and `molecule`.
3. Installs several Homebrew cask packages, including `arc`, `iterm2`, `visual-studio-code`, `1password`, `rectangle`, `font-hack-nerd-font`, `jetbrains-toolbox`, `nordvpn`, `switchresx`, `discord`, `istat-menus`, `signal`, `docker`, `postman`, `gimp`, `obs`, and `krisp`.
4. Creates directories at `~/stuffy`, `~/stuffy/code`, and `~/stuffy/playground`.

## Notes

Please note: This configuration is specifically tailored for MacOS systems. Other operating systems are not currently supported. Linux support coming soon.

## License
This project is licensed under the MIT License. See the LICENSE file for details.