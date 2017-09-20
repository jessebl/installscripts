#!/bin/bash

ansible_playbook=$(dirname $0)/helper0.yml

# Exits if Ansible is not installed/in $PATH
if ! command -v ansible >/dev/null 2>&1; then
  echo "Please install Ansible"
  # Installs ansible for systems with apt-get
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get install ansible -y ||
      echo "Installation of Ansible failed"
  else
    echo "Exiting."
    exit
  fi
else
  echo "Ansible is installed"
fi

# Use Ansible to finish configuration
echo "Running Ansible playbook $ansible_playbook"
echo "Root access required for package management"
ansible-playbook $ansible_playbook -K
