# dotfiles

Portable shell and Git configuration extracted from this machine.

## Layout

- `home/`: files linked into `$HOME`
- `config/`: files linked into `$HOME/.config`
  - `nano/`: GNU nano config and syntax definitions
- `install.sh`: creates symlinks with backups

## Install

```sh
./install.sh
```

The installer backs up existing files to `*.bak`.

## Local overrides

Copy the example files if you want machine-specific or private settings:

```sh
cp home/.gitconfig.local.example ~/.gitconfig.local
cp home/.zshrc.local.example ~/.zshrc.local
```
