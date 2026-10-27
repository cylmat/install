# Zsh install


## Install
- https://www.zsh.org

```
sudo apt install -y zsh && zsh --version
# change shell to zsh
chsh -s $(which zsh)

# go to zsh, then follow zsh configuration (zsh-newuser-install.)
zsh
```

## In Zsh

```
echo $SHELL && $SHELL --version

### bench
# add at the beginning and end of .zshrc :
# "zmodload zsh/zprof"  ... ~/.zshrc content...  "zprof" EOF
# see https://github.com/romkatv/zsh-bench

```


## Plugin Manager 
------------------

### OhMyZsh
- @https://ohmyz.sh

```
# zsh-omz:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Speed up OMZ
- from https://scottspence.com/posts/speeding-up-my-zsh-shell

in .zshrc
```shell
# Top of .zshrc
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# Smarter completion once a day
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# omz
plugins=(
    ...
    zsh-syntax-highlighting  # Always last!
)

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# spaceship
SPACESHIP_PROMPT_ASYNC=false
```


### Antidote Zsh plugin Manager

```
# git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# in ~/.zshrc
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
#source ${ZDOTDIR:-~}/.antidote/antidote.zsh
#[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt
#antidote load

###
### Prezto Zsh plugin Manager
# http://jeromedalbert.com/migrate-from-oh-my-zsh-to-prezto/
###
# https://github.com/sorin-ionescu/prezto


###
### Zsh unplugged (un)plugin manager
###
# https://github.com/mattmc3/zsh_unplugged
```


### Completion & suggestions
--------------------------

```
#  zsh Autosuggestion 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# plugins=(...zsh-autosuggestions)

#  zsh Syntax highlighting
# ! Always in last plugin section !
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# plugins=( ...zsh-syntax-highlighting)
```

```
### ---docker completion
# @https://docs.docker.com/engine/cli/completion/#zsh

mkdir -p ~/.oh-my-zsh/completions
$ docker completion zsh > ~/.oh-my-zsh/completions/_docker

### --- git Autocompletion
# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash  
# https://www.oliverspryn.com/blog/adding-git-completion-to-zsh  

mkdir -p ~/.zsh  && cd ~/.zsh       
curl -o git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
# -> in ~/.zsh  
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath) 
autoload -Uz compinit && compinit
```


### PROMPT 

```
# Starship
# use Omz or add in ~/.zshrc: 
eval "$(starship init zsh)"
```

## Plugins

- @https://github.com/unixorn/awesome-zsh-plugins
