#!/bin/bash

ansible_playbook=$(dirname $0)/helper0.yml

# Only works for Ubuntu systems
if grep -q Ubuntu /etc/lsb-release; then
  # Checks if Ansible is installed
  if ! dpkg -l ansible > /dev/null ; then
    echo "Installing Ansible..."
    sudo apt install ansible -y
  fi
  echo "Ansible is already installed"
fi	

# Use Ansible to finish configuration
echo "Running Ansible playbook $ansible_playbook"
echo "Root access required for package management"
ansible-playbook $ansible_playbook -K
