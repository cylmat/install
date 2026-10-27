ZSH_THEME="cloud"  # set by `omz`
# Override ~/.omz.zsh and allow use of "omz theme enable <plugin>"

###############
### INSTALL ###
###############

### INSTALL ZSH
# sudo apt install -y curl git fzf unzip wget zsh
# chsh -s "$(command -v zsh)"
# -> ! TOTALLY CLOSE SHELL AND WSL ! <-
# echo $0

### INSTALL OMZ
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### INSTALL STARSHIP
# curl -sS https://starship.rs/install.sh | sh   

# ###
# Doc
# - https://doc.ubuntu-fr.org/zsh
# - https://wiki.archlinux.org/title/zsh
#
# Plugins
# - https://github.com/jeffreytse/zsh-vi-mode
# - https://github.com/unixorn/awesome-zsh-plugins
#
# Tips
# - https://www.twilio.com/fr-fr/blog/astuces-zsh
#
# Remove zsh with 
# chsh -s /bin/bash && apt-get --purge remove zsh
# ###

### CUSTOM ###

# set docker options dns
export DOCKER_OPTS="--dns=1.1.1.1 --dns=8.8.8.8"


# Use file
# mv ~/.zshrc ~/.zshrc.bak && curl https://raw.githubusercontent.com/cylmat/docs/refs/heads/main/install/.home/.zshrc > ~/.zshrc 
# source ~/.zshrc

#####################
### Configuration ###
#####################

### Use Plugin manager
USE_OMZ=1
USE_ZSH=0

### Use themes
USE_STAR=1
USE_PWR10=0

######################
### Autocompletion ###
######################

### docker ###
### https://docs.docker.com/engine/cli/completion

# mkdir -p ~/.docker/completions
# docker completion zsh > ~/.zsh/completions/_docker
# FPATH="$HOME/.zsh/completions:$FPATH"

### kube ###
### https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#enable-shell-autocompletion
### CAN BE SLOW

# kubectl completion zsh > ~/.zsh/completions/kubectl-completion.zsh
# source ~/.zsh/completions/kubectl-completion.zsh

### git ###

# curl -o ~/.zsh/completions/git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
# curl -o ~/.zsh/completions/git-prompt.sh https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# zstyle ':completion:*:*:git:*' script ~/.zsh/completions/git-completion.zsh


###############
### MAPPING ###
###############

# different  behavior with vi-style (omz "vi-mode")

# bindkey '^K' kill-line
# bindkey '^Y' yank
# etc...

#################
### Oh MY ZSH ###
#################

if [[ "1" == "$USE_OMZ" ]]; then
    # Override ~/.omz.zsh and allow use of "omz plugin enable <plugin>"
    plugins=(git)
    source $HOME/.omz.zsh 
fi


#################
### THEME top ###
#################

### POWERLEVEL 10K ###

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/ zshrc. 
# Initialization code that may require console input (password prompts) [y/n]
# confirmations, etc.) must go above this block; everything else may go below. 

if [[ "1" == "$USE_PWR10" ]]; then
    [[ -f ~/.p10k-top.zsh ]] && source ~/.p10k-top.zsh
fi

# set "blue light" directory colors
export EZA_COLORS="di=01;36" 

#######
# ENV #
#######


### PATH
# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HOME/.symfony5/bin:$PATH"
export PATH="$HOME/.volta/bin:$PATH"

### Linuxbrew ###
# -> must be before sourcing ~/.omz.zsh to avoid "eza not loaded" error
if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


export TERM=xterm-256color
export SHELL="zsh"
export EDITOR='vim'

### remove ending '%' on partial line (ex print -n "test")
PROMPT_EOL_MARK=''


###########
# ALIASES #
###########

[[ -f ~/.aliases ]] && source ~/.aliases


#############
### THEME ###
#############

### POWERLEVEL 10K ###
### @https://github.com/romkatv/powerlevel10k
### To customize prompt, run `p10k configure` or edit ~/.p10k.zsh

if [[ "1" == "$USE_PWR10" ]]; then
    [[ -d ~/powerlevel10k ]] && source ~/powerlevel10k/powerlevel10k.zsh-theme   
    [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
fi


### Starship prompt ###
### @https://starship.rs1 
### curl -sS https://starship.rs/install.sh | sh   

if [[ "1" == "$USE_STAR" ]]; then
    eval "$(starship init zsh)"
fi


### FastFetch (os informations) ###

# fastfetch 


## original .zshrc
[[ -f ~/.zshrc.orig ]] && source ~/.zshrc.orig


### Added for no-manager plugins
if [[ "1" == "$USE_ZSH" ]]; then
    [[ -f ~/.plugins.zsh ]] && source ~/.plugins.zsh
fi
