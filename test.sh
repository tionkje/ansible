#!/usr/bin/env bash
TAGS=${1:-install}
set -e
if [ ! -f /tmp/secrets/vaultpass ]; then
  mkdir -p /tmp/secrets
  echo "Enter the password ending with C-d:"
  cat > /tmp/secrets/vaultpass
fi
docker build -t arch-setup . 
# docker run --rm -it arch-setup 
docker run --rm -it -v /tmp/secrets:/tmp/secrets arch-setup bash -c "ansible-playbook -t $TAGS local.yml --vault-password-file /tmp/secrets/vaultpass && zsh"
