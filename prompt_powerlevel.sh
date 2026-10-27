#!/usr/bin/env bash

##############
# powerlevel #
##############
# https://github.com/romkatv/powerlevel10k

# FONT
# curl https://raw.githubusercontent.com/cylmat/docs/refs/heads/main/install/script/nerdfonts-install.sh | bash

##########
# https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#installation
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
exec zsh
# or (p10k configure)
# ###

#########
# https://medium.com/@satriajanaka09/setup-zsh-oh-my-zsh-powerlevel10k-on-ubuntu-20-04-c4a4052508fd
#
# sudo apt-get install fonts-powerline
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# in ~/.zshrc
# ZSH_THEME="powerlevel10k/powerlevel10k"
# p10k configure
# ###



############
# @https://vaibhavsblog.hashnode.dev/customise-your-z-shellzsh-without-using-oh-my-zsh
# 
# git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
# curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz     (FiraCode.tar.xz)
# p10k configure
# ###


