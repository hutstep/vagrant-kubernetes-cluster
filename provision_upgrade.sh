#!/bin/bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

sudo apt-get -qq update
sudo apt-get -y -qq dist-upgrade
sudo apt-get -y -qq autoremove
