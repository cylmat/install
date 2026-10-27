#!/usr/bin/env bash

##########################################################################
# Prompt #
#########

# Powerline FONT
sudo apt install -y fonts-powerline
sudo wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/


### @https://ohmyposh.dev
curl -s https://ohmyposh.dev/install.sh | bash -s
oh-my-posh get shell
echo 'eval "$(oh-my-posh init bash)"' >> ~/.bashrc

