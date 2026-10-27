#!/bin/bash

# use
# curl https://raw.githubusercontent.com/cylmat/docs/refs/heads/main/install/script/homebrew-install.sh | bash

RC="$HOME/.bashrc"
if [[ "$SHELL" == '/bin/zsh' ]]; then
    RC="$HOME/.zshrc"
fi


/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

GREP=$(grep 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' $RC)
if [[ -z GREP ]]; then
    echo "Add eval Homebrew in $RC"
    echo >> $RC
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $RC
fi

GREP=$(grep 'PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' $RC)
if [[ -z GREP ]]; then
   echo "Add PATH Homebrew in $RC"
   echo 'PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> $RC
fi

PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# sudo apt-get install build-essential
# brew install gcc

