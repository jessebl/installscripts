# Installscripts 

This repo contains a mishmash of things for my own convenience. Among other
things:

- Configs

- Random scripts

- Ansible playbooks

## Configs

Configuration files (found in [configs/](configs)) are structured for use with
GNU `stow`, whose use I highly recommend (although you can manually copy config
files if you'd rather, or don't have access to `stow` for whatever reason). The
above directory contains subdirectories that are considered "packages" by
`stow`, and configurations are applied at the package level (e.g. you apply the
"neovim" package, as there is a [configs/neovim/](configs/neovim) directory).

### Using `stow`

Let's say that we want to apply the neovim package, and that you have cloned
this repo to `~/installscripts/`. You need to tell `stow` a few things:

1. The directory in which to to find packages (`~/installscripts/configs/`), specified with the `-d` flag

2. The directory in which to create symlinks that correspond to the files in the package (`~/`), specified with the `-t` flag

3. The package to deploy (`neovim`), given as an argument

This gives us the following command:

```bash

stow -d ~/installscripts/ -t ~ neovim

```

### filebot.sh

Uses the program `filebot` to rename media files (movies, TV, anime) and
rearrange them in a nicer, neater directory structure. The variables inside the
script should be self-explanatory.

### nautilus-to-nemo.sh 

This script replaces Nautilus (Ubuntu's default file manager) with Nemo,
which is more configurable. Nemo will be installed and set as the default
file manager.

### themeInstall.sh

Installs the "ultra flat" theme from this repo.

