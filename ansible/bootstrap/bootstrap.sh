#!/bin/bash

ansible_playbook=$(dirname $0)/helper0.yml

if grep -q Ubuntu /etc/lsb-release; then
  if ! dpkg -l ansible > /dev/null ; then
    echo "Installing Ansible..."
    sudo apt install ansible -y
  fi
  echo "Ansible is already installed"
fi	

echo "Running Ansible playbook $ansible_playbook"
echo "Root access required for package management"
ansible-playbook $ansible_playbook -K
