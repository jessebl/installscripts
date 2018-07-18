# Installscripts 

This repo contains a mishmash of things for my own convenience. Among other
things:

- Configs

- Random scripts

- Ansible playbooks

## Ansible

To run ansible playbooks, you will need it installed. Once you have installed
it, (which are most of the `.yml` files in [ansible/](ansible)), run the
command `ansible-playbook <path to ansible playbook>`. If anything in the
playbook requires root access, add the `-K` flag to prompt for `sudo`
authentication. Please note that most of playbooks have only been written for
Ubuntu 16.04, but supporting multiple platforms (especially CentOS) is an
ongoing goal of mine.

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

## Shell scripts

While I am trying to move to Ansible for most configuration, some things are
done better as simple shell scripts.

### filebot.sh

Uses the program `filebot` to rename media files (movies, TV, anime) and
rearrange them in a nicer, neater directory structure. The variables inside the
script should be self-explanatory.
