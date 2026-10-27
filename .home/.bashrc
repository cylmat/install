# @ref
# https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c

export PUID=$(id -u)
export PGID=$(id -g)

###########
# ALIASES #
###########
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# COMPLETION #
if [[ ! -f /usr/share/bash-completion/bash_completion ]]; then
  apt update && apt install -y bash-completion
  source /usr/share/bash-completion/bash_completion
fi;

# GIT #
if [[ ! -f ~/git-completion.bash ]]; then
  wget https://github.com/git/git/blob/master/contrib/completion/git-completion.bash -O ~/git-completion.bash
  source ~/git-completion.bash
fi
