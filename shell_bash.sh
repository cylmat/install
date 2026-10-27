#!/bin/bash

# build-prerequisites
# can use too : apt install ninja-build
sudo apt-get install gettext cmake unzip curl
sudo apt install -y software-properties-common




### Bash @https://www.gnu.org/software/bash
# @https://github.com/ohmybash/oh-my-bash
# @https://github.com/awesome-lists/awesome-bash


# BASH-it #
# https://github.com/Bash-it/bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && ~/.bash_it/install.sh

### ble.sh
# https://github.com/akinomyoga/ble.sh
apt update && apt install -y gawk
git clone --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc
