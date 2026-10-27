#!/usr/bin/env bash

# stop on errors
set -e

### ######################### ###
### MINIMAL REMOTE VIM CONFIG ###
### ######################### ###

# ###
# usage:
# curl https://raw.githubusercontent.com/cylmat/docs/refs/heads/main/install/script/vim-minimal.sh | bash
# ###

apt update && apt install -y curl

DEBIAN_FRONTEND=noninteractive TZ=Europe/Paris apt-get -y install tzdata git vim

export PLUGIN_DIR="$HOME/.vim/pack/plugins/start"

# create 
echo "Run"
echo "create ~/.vim/pack/plugins/start"
echo ""

mkdir -p "$PLUGIN_DIR"

# plugins

echo "Installing plugins..."

echo ":h NERDTree"
test -d "$PLUGIN_DIR/nerdtree"       || git clone --depth 1 https://github.com/scrooloose/nerdtree $PLUGIN_DIR/nerdtree
echo ":h easymotion (default '\')"
test -d "$PLUGIN_DIR/vim-easymotion" || git clone --depth 1 https://github.com/easymotion/vim-easymotion.git $PLUGIN_DIR/vim-easymotion
echo ":h sneak"
test -d "$PLUGIN_DIR/vim-sneak"      || git clone --depth 1 https://github.com/justinmk/vim-sneak $PLUGIN_DIR/vim-sneak
echo ":h surround"
test -d "$PLUGIN_DIR/vim-surround"   || git clone --depth 1 https://github.com/tpope/vim-surround $PLUGIN_DIR/vim-surround


echo "Listing plugins..."
ls -al "$PLUGIN_DIR"

echo "Use in Vim:"
echo ':set runtimepath?'
echo

vim -c "helptag ALL" -c q
