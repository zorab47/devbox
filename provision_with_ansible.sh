#!/bin/bash

if ! command -v ansible-playbook >/dev/null; then
  echo "Installing ansible ..."
  if aptitude show ansible &>/dev/null; then
    sudo aptitude install --assume-yes ansible
  else
    echo "Ansible is unavailable!!"
    exit 1
  fi
fi

echo "Running ansible playbook /vagrant/ansible.yml ..."

ansible-playbook \
  --inventory-file=localhost, \
  --connection=local \
  /vagrant/ansible.yml $*
