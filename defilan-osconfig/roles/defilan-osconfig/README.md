# defilan-osconfig

Ansible role for configuring macOS and Debian development environments.

## Configuration Profiles

This role supports three configuration profiles, selected via the `config` variable:

| Profile | Description |
|---------|-------------|
| `lightweight` | Essentials only -- basic cask apps (Arc, iTerm2, 1Password, Rectangle, iStat Menus) |
| `developer` | Full developer setup -- CLI tools, languages, containers, and dev-focused cask apps |
| `home` | Productivity/full config -- everything in developer plus personal apps (NordVPN, Discord, Signal, GIMP, Krisp) |

## Requirements

- Ansible >= 2.14
- `community.general` collection (see `requirements.yml`)
- macOS with Homebrew or Debian/Ubuntu with apt

Install collection dependencies:

```bash
ansible-galaxy collection install -r requirements.yml
```

## Role Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `config` | `lightweight` | Configuration profile to use |
| `go_version` | `1.23.6` | Go version to install on Debian |

Package lists are defined in `vars/main.yml` under the `config_packages` dictionary.

## Usage

```bash
# Run with install.sh (recommended)
./install.sh

# Run playbook directly
ansible-playbook defilan-osconfig/playbook.yml -e "config=developer"
```

## Tags

Tasks are tagged for selective runs:

- `packages` -- all package installation
- `homebrew` -- Homebrew packages and casks (macOS)
- `cask` -- Homebrew cask packages only (macOS)
- `apt` -- apt packages (Debian)
- `go` -- Go language installation (Debian)
- `zsh` / `shell` -- oh-my-zsh and shell configuration
- `directories` -- directory creation

Example: `ansible-playbook playbook.yml -e "config=developer" --tags packages`

## License

MIT

## Author

Christopher Maher
