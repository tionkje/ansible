#!/bin/sh

sudo pacman -S --noconfirm ansible

ANSIBLE_ASK_VAULT_PASS=True ansible-pull -KU https://github.com/tionkjt/ansible.git
