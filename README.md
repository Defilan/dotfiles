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

The Ansible playbook installs a variety of applications and performs customizations to the MacOS or Debian environment. The packages are organized efficiently with shared packages common across configurations and configuration-specific additions.

#### Package Organization

**Shared Packages** (installed in both Developer and Home configurations):
- **Homebrew Taps**: `aws/tap`, `hashicorp/tap`, `twilio/brew`
- **Homebrew Packages**: `aws-sam-cli`, `awscli`, `battery`, `exercism`, `git-extras`, `go`, `hashicorp/tap/packer`, `hashicorp/tap/terraform`, `kubectl`, `molecule`, `neovim`, `node`, `redis`, `skaffold`, `thefuck`, `tmux`, `twilio`, `yarn`
- **Homebrew Cask Packages**: `1password`, `arc`, `cursor`, `docker`, `font-hack-nerd-font`, `ghostty`, `istat-menus`, `iterm2`, `jetbrains-toolbox`, `obs`, `postman`, `rectangle`, `switchresx`, `visual-studio-code`
- **APT Packages** (Debian): `git-extras`, `golang-go`, `neovim`, `thefuck`, `tmux`, `zsh`

#### Configuration-Specific Packages

**Lightweight Configuration** (Essentials only):
- **Homebrew Cask Packages**: `1password`, `arc`, `istat-menus`, `iterm2`, `rectangle`

**Developer Configuration** (Clean development environment):
- **Additional Packages**: None (uses shared packages only)

**Home Configuration** (Full productivity setup):
- **Additional Homebrew Cask Packages**: `discord`, `gimp`, `krisp`, `microsoft-office`, `nordvpn`, `signal`

#### Additional Features

1. **Directory Structure**: Creates directories at `~/stuffy`, `~/stuffy/code`, and `~/stuffy/playground`
2. **Shell Configuration**: Sets up ZSH with Oh My Zsh and autosuggestions
3. **Go Installation**: Installs Go 1.22.2 on Debian systems
4. **Git Configuration**: Sets up global git configuration

## Notes

Please note: This configuration is specifically tailored for MacOS and Debian systems. Other operating systems are not currently supported yet.

## License
This project is licensed under the MIT License. See the LICENSE file for details.