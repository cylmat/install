#!/usr/bin/env bash

###
### Essential and common tools for day-by-day work
### Keep simple and light, without cargo or npm install
### 

# use:
# curl https://raw.githubusercontent.com/cylmat/docs/refs/heads/main/install/tools_essential.sh > /tmp/tools_essential.sh
# bash /tmp/tools_essential.sh



#############
### Shell ###
#############
# busybox.net : dos2unix, du, nc, netstat (net-tools), ps (procps), wget...
# nixos.org
#############

sudo apt install -y \
busybox


#############
### Build ###
#############

sudo apt install -y \
make \
gnupg


##############
### Common ###
##############
# curl
# dnsutils (dig + nslookup)
# duf : disk usage
# git
# htop
# locales 
# lsof
# manpages
# openssl
# sqlite3
##############

sudo apt install -y \
curl \
duf \
htop \
procps \
sqlite3

### networks
### iproute2 (ip), iputils-ping
sudo apt install -y \
lsof \
net-tools \ # ifconfig
netcat \
telnet


### locales and man
sudo apt install -y \
locales \
manpages \
man-db 



###########
### DEV ###
###########
# git-scm.com
# neovim.io
# vim.org
###########
# git >100Mo
# vim >40Mo
###########

sudo apt install -y \
git \
vim


### Docker
### follow :
### https://raw.githubusercontent.com/cylmat/docs/refs/heads/main/install/script/docker-cli-install.sh


### Kubectl (50Mo)
### https://kubernetes.io/docs/tasks/tools/install-kubectl-linux
curl -L -o /tmp/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -L -o /tmp/kubectl.sha256 "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat /tmp/kubectl.sha256) /tmp/kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 /tmp/kubectl /usr/local/bin/kubectl
kubectl version --client


#############
### Utils ###
#############
# bat (cat with color)
# ccze (color logs)
# fd-find (user-friendly alternative to 'find')
# fzf (command-line fuzzy finder | fzf)
# fzy (fzf-like | fzy)
# icdiff (colored diff)
# jq (json formatter)
# ranger (filesystem manager)
# rsync (remote synchronization)
# tig (git logs)
# tmux (terminal multiplexer)
# tmuxinator
# tre (tree improved)
# ugrep (user-friendly faster grep)
# vifm (Vim-like environment files)
# yq (jq for yaml)
#############


sudo apt install -y \
bat \
ccze \
fd-find \
fzf \
fzy \
icdiff \ # >20Mo
jq \
rsync \
tmux \
tmuxinator \ # >40Mo
tre-command \
ugrep \
yq



### Fzf 
# source <(fzf --zsh)

### Cheat.sh 
### https://github.com/chubin/cheat.sh
curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht && sudo chmod +x /usr/local/bin/cht > /dev/null

###
### chatGPT-shell-cli ###
###

### https://github.com/0xacx/chatGPT-shell-cli
echo "installing ChatGPT shell cli"
sudo apt install -y jq
curl -s https://raw.githubusercontent.com/0xacx/chatGPT-shell-cli/refs/heads/main/chatgpt.sh | sudo tee /usr/local/bin/chatgpt > /dev/null
echo 'add in /usr/local/bin/chatgpt on line 20 : OPENAI_KEY=$(echo $OPENAI_KEY | base64 -d)'
echo 'add in .zshrc or .bashrc :'
echo 'export OPENAI_KEY=your_base64_key_here'



############
### Brew ###
############

curl https://raw.githubusercontent.com/cylmat/docs/refs/heads/main/install/script/homebrew-install.sh | bash


#######
# App #
#######
# gcc >600Mo
# binutils >400Mo
# btop (A monitor of resources)
# eza.rocks (A modern, maintained replacement for ls)
# fastfetch-cli (neofetch like system information tool)
# nushell.sh (shell pipelines to control any OS)
#######

brew install \
btop \
eza \
fastfetch



### Docker, git, k8s
# brew install lazygit 
# brew install derailed/k9s/k9s
# brew install kdash-rs/kdash/kdash

### lazydocker
# curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

### sampler
# config : curl https://github.com/sqshq/sampler/blob/master/example.yml > ~/.config/sampler.yml
brew install sampler


### check size
# brew list --formula | xargs -n1 -P8 -I {} \
# sh -c "brew info {} | egrep '[0-9]* files, ' | sed 's/^.*[0-9]* files, \(.*\)).*$/{} \1/'" | \
# sort -h -r -k2 - | column -t
###


############
# TRAINING #
############

### TT 
### https://github.com/lemnos/tt
sudo curl -L https://github.com/lemnos/tt/releases/download/v0.4.2/tt-linux -o /usr/local/bin/tt && sudo chmod +x /usr/local/bin/tt
sudo curl -o /usr/share/man/man1/tt.1.gz -L https://github.com/lemnos/tt/releases/download/v0.4.2/tt.1.gz


### ####################### ###
### Heavy packages >100Mo ! ###
### ####################### ###

### nix 
# sudo apt install -y nix
#   (or) 
# curl -L https://nixos.org/nix/install | sh -s -- --daemon
#   (or) 
# sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon

### nu
# brew install nushell

### dev ###

### Minikube
### https://minikube.sigs.k8s.io/docs/start
# curl -L -o /tmp/minikube-linux-amd64 https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
# sudo install /tmp/minikube-linux-amd64 /usr/local/bin/minikube && rm /tmp/minikube-linux-amd64

### build
# sudo apt install -y build-essential cmake gcc software-properties-common

### common
# sudo apt install -y dnsutils openssl

### tools and manager
# sudo apt install -y command-not-found ranger tig vifm




### useful
### rlwrap (allow the editing of keyboard input for any command)
### socat (relay for bidirectional data transfers)



### Clear

echo "Clear APT"

sudo apt clean
sudo apt autoclean
sudo apt autoremove

echo "Tools essential installed"
echo
