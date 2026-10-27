#!/usr/bin/env bash


### Utils ###


# ack
# bc calculator
# btop monitor 
# cal (or ncal) calendar
# httpie : curl
# finger : user information lookup
# ncdu : disk manager
# nnn file manager
# pass (password manager)
# peco (filter)
# taskwarrior manager
# TlDr (cheatsheets for console commands)
# visidata
# xsel (manipulate X selection)

sudo apt install -y \
ack \
bc \
cal \
iredis \
httpie \
finger \
ncdu \
nnn \
pass \
peco \
taskwarrior \
tldr && tldr --update \
visidata \
xsel


### snap
# snap install apps (https://snapcraft.io)
# sudo apt install -y snap

########
# BREW #

# autojump
# diff-so-fancy
# dnote
# fpp (file PathPicker)
# gh (github cli, https://cli.github.com)
# glow (render markdown)
# gron (grep json)
# joshuto
# navi (cheats list by denisidoro/navi)
# ripgrep
# scc
# tokei (count your code)
# twf (Standalone tree view file explorer, inspired by fzf)
# wtfutil

brew install \

autojump \
diff-so-fancy \
fpp \
gh \
glow \
gron \
joshuto \
krew \
lnav \
navi \
ripgrep \
scc \
tokei \
wtfutil

brew install --HEAD wvanlint/twf/twf

brew tap dnote/dnote && brew install dnote

### autojump or z ###
# https://github.com/wting/autojump
# https://github.com/agkozak/zsh-z (omz's "z" plugin)

#########
# cargo #
# rust (cargo use crates.io)

sudo apt install cargo

# bandwhich
# - use with Keep current ENV : 
# - sudo -E bandwhich  
# - sudo env "PATH=$PATH" bandwhich 
# - sudo $(command -v bandwhich)
# dust
# git-delta
# grex regex generator
# just
# lsd
# loop-rs
# Procs : https://github.com/dalance/procs
# sd : sed-like
# so StackOverflow https://github.com/samtay/so
# tidy-viewer (CSV viewer)
# toipe : typing test


cargo install \
bandwhich \
dust \
git-delta \
grex \
just \
lsd \
loop-rs \
procs \
sd \
so \
tidy-viewer \
toipe

############
### HTTP ###
############

### curlie @https://github.com/rs/curlie
# use curlie httpbin.org/headers

curl -sS https://webinstall.dev/curlie | bash

### Entr (use inotify)

git clone https://github.com/eradman/entr /tmp/entr
cd /tmp/entr && ./configure && make test && make install && sudo make install

### Explain ###
# @https://github.com/benjamine/explain.sh

curl -s https://benjamine.github.io/explain.sh/install.sh | sh
sudo cp /usr/bin/explain.sh /usr/bin/explain



### HTTP PROMPT @https://http-prompt.com

sudo apt install python3-pip
pip install http-prompt

### idea @https://github.com/IonicaBizau/idea
# npm install --global idea

### micro (nano like) ###
# sudo apt install micro


### OPENAI ###

# ai-shell
https://github.com/BuilderIO/ai-shell
curl https://get.volta.sh | bash
volta install node
npm install -g @builder.io/ai-shell
ai config set OPENAI_KEY=<your token>



### @https://doc.ubuntu-fr.org/awesome

### UP ultimate plumber (abandoned)
# @https://github.com/akavel/up
# use ex: lshw |& ./up

#wget https://github.com/akavel/up/releases/latest/download/up -O /tmp/up
#chmod a+x /tmp/up
#sudo mv /tmp/up /usr/local/bin/up

### YAI ai assistant ###
curl -sS https://raw.githubusercontent.com/ekkinox/yai/main/install.sh | bash

### zsh bench (benchmark)
git clone https://github.com/romkatv/zsh-bench ~/zsh-bench



#######################
# Network & Server #
####################

# @https://nmap.org: Security scanner
# @https://www.ntop.org: Network monitor
# Netstat (ss) @use : ss -plunt
sudo apt install -y net-tools nmap

### Ajenti @http://docs.ajenti.org/en/latest/man/install.html

### Lynx @https://lynx.invisible-island.net/
sudo apt install -y lynx

### W3m terminal browser
sudo apt install -y w3m w3m-img

### NVM + Node
# Volta 
curl https://get.volta.sh | bash
volta install node

#########
# DEV #
#######

### Kubectl & minikube ###

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

### kdash
# brew install kdash-rs/kdash/kdash
# sudo apt install -y kdash


############
### FUN ###
###########

# https://www.tecmint.com/funny-linux-commands/
# https://ostechnix.com/fun-linux-command-line-tools/
# https://doc.ubuntu-fr.org/tutoriel/matrix_terminal

# cmatrix, cbonsai 
# figlet/sysvbanner display ascii text
# sl : train when mistyping "ls" @https://github.com/mtoyoda/sl
#   or
# https://gir.st/blog/sl-alt.htm

sudo apt install -y \
cmatrix cbonsai \
figlet \
sl \
sysvbanner


### fortune ###
# fortune -s | cowsay | lolcat
# cowsay -f tux "I love Linux!"
# cowsay -e ^^ -T UU "I use Arch Linux BTW!"

sudo apt install -y cowsay fortune lolcat

### WELCOME script

curl -s https://raw.githubusercontent.com/Lissy93/dotfiles/master/utils/welcome-banner.sh | sudo tee ~/welcome.sh | sudo chmod a+x ~/welcome.sh

### no more secrets ###

# from 1992 hacker movie Sneakers
# https://github.com/bartobri/no-more-secrets
# use ex: ls | nms -a

git clone https://github.com/bartobri/no-more-secrets.git /tmp/no-more-secrets
cd /tmp/no-more-secrets && make nms && make sneakers && sudo make install && cd -

### typing ###

# @https://github.com/lemnos/tt
sudo curl -L https://github.com/lemnos/tt/releases/download/v0.4.2/tt-linux -o /usr/local/bin/tt && sudo chmod +x /usr/local/bin/tt

# @https://github.com/max-niederman/ttyper
# @https://github.com/Samyak2/toipe
sudo apt install -y cargo && cargo install ttyper toipe

# gtypist @https://doc.ubuntu-fr.org/gtypist
sudo apt install gtypist

# see balzss/cli-typer
# see Typon 

### see other...
# https://github.com/orangekame3/paclear
# https://github.com/AngelJumbo/lavat
# https://opensource.com/article/18/12/linux-toy-aafire
