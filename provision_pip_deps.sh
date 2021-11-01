#!/bin/bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

sudo apt-get -y -qq install python3-distutils python3-apt
