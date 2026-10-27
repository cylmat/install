#!/bin/bash

# https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#font-installation
# https://www.nerdfonts.com

### INSTALL !!!
# sudo apt install -y fontconfig

echo -e "\uE0B0 \uF120 \uF0E7 \uF013"
echo -e "\ue7a8 \uf09b \uf303 \ue795"

if [[ -f ~/.local/share/fonts/JetBrainsMonoNerdFont-Bold.ttf ]]; then
  echo "JetBrains already installed"
  echo -e "\uE0B0 \uF120 \uF0E7 \uF013"
  echo
  exit 0
fi


mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

# Download and unzip (JetBrainsMono.zip) -not- FiraCode for nvim 
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip && rm JetBrainsMono.zip

fc-cache -fv
# test
fc-list | grep -i "nerd"
echo -e "\uE0B0 \uF120 \uF0E7 \uF013"
echo -e "\ue7a8 \uf09b \uf303 \ue795"

# (🗲 https://www.compart.com/fr/unicode/U+F0E7)

###                 ###
### !! IMPORTANT !! ###
### Install it for Windows terminal too: Download zip, right-click on each fonts
### In terminal "appearance", configure "JetBrainsMono Nerd Font"
###                 ###


######### Powerline FONT
# sudo apt-get install fonts-powerline

# sudo apt install -y fonts-powerline
# sudo wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
# sudo mv PowerlineSymbols.otf /usr/share/fonts/
# sudo fc-cache -vf
# sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
###



############################
### old way

#sudo add-apt-repository universe
#sudo apt-get update
# or sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"

#sudo apt install fonts-firacode



######
# wget install
######

# cd ~/.local/share/fonts
# wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
# unzip FiraCode.zip && rm FiraCode.zip
# fc-list | grep -i "firacode"
# ls ~/.local/share/fonts/FiraCodeNerdFont-Bold.ttf
# && fc-cache -fv
