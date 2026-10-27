#!/usr/bin/env bash

############
# Starship #
############

# FONT
# curl https://raw.githubusercontent.com/cylmat/docs/refs/heads/main/install/script/nerdfonts-install.sh | bash


RC="$HOME/.bashrc"
if [[ "$SHELL" == '/bin/zsh' ]]; then
    RC="$HOME/.zshrc"
fi

### Starship @https://starship.rs
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo 'eval "$(starship init bash)"' >> $RC
mkdir -p ~/.config && touch ~/.config/starship.toml
