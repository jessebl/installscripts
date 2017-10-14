# Ansible Playbooks

Run desired playbooks with

```bash
ansible-playbook -i $playbook_name	# for unprivileged playbooks
ansible-playbook -i $playbook_name -K	# for playbooks that need root/sudo
```

## neovim.yml

*Requires root/sudo access*

Installs and configures neovim on localhost

## zsh.yml

*Requires root/sudo access*

Installs and configures zsh with oh-my-zsh on localhost, assuming you have
root/sudo access
