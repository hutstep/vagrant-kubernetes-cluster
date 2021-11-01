#!/bin/bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

echo \
  "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" \
  | sudo tee /etc/apt/sources.list.d/ansible.list > /dev/null

sudo apt-get -y -qq install gnupg
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt-get update
sudo apt-get -y -qq install ansible