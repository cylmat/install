### Manager-free Zsh plugins ###

### Install with brew and ohMyZsh
### Load from direct sourcing

### BREW ###
# brew install zsh-autosuggestions zsh-syntax-highlighting 
source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
###

# omz lib
source $HOME/.oh-my-zsh/lib/completion.zsh
source $HOME/.oh-my-zsh/lib/directories.zsh
source $HOME/.oh-my-zsh/lib/grep.zsh
source $HOME/.oh-my-zsh/lib/history.zsh

# omz plugins
OMZ_PLUGINS_DIR=$HOME/.oh-my-zsh/plugins

source $OMZ_PLUGINS_DIR/aliases/aliases.plugin.zsh

# alias finder
source $OMZ_PLUGINS_DIR/alias-finder/alias-finder.plugin.zsh
zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default

source $OMZ_PLUGINS_DIR/brew/brew.plugin.zsh
source $OMZ_PLUGINS_DIR/colorize/colorize.plugin.zsh
source $OMZ_PLUGINS_DIR/colored-man-pages/colored-man-pages.plugin.zsh
source $OMZ_PLUGINS_DIR/command-not-found/command-not-found.plugin.zsh
source $OMZ_PLUGINS_DIR/common-aliases/common-aliases.plugin.zsh
source $OMZ_PLUGINS_DIR/composer/composer.plugin.zsh

# ctrl-o to copy the current text in the command line to the system clipboard
source $OMZ_PLUGINS_DIR/copybuffer/copybuffer.plugin.zsh

# copyfile <filename> to copy the file named filename
source $OMZ_PLUGINS_DIR/copyfile/copyfile.plugin.zsh

# copypath <file_or_directory>: copies the absolute path of the given file
source $OMZ_PLUGINS_DIR/copypath/copypath.plugin.zsh

# navigate dir with ALT + ← → ↑ ↓
source $OMZ_PLUGINS_DIR/dirhistory/dirhistory.plugin.zsh

source $OMZ_PLUGINS_DIR/docker/docker.plugin.zsh
source $OMZ_PLUGINS_DIR/eza/eza.plugin.zsh
source $OMZ_PLUGINS_DIR/git/git.plugin.zsh
source $OMZ_PLUGINS_DIR/git-flow/git-flow.plugin.zsh
source $OMZ_PLUGINS_DIR/gnu-utils/gnu-utils.plugin.zsh
source $OMZ_PLUGINS_DIR/rsync/rsync.plugin.zsh

# pressing the <esc><esc> sudo prefix the same command 
source $OMZ_PLUGINS_DIR/sudo/sudo.plugin.zsh

source $OMZ_PLUGINS_DIR/tig/tig.plugin.zsh
source $OMZ_PLUGINS_DIR/tmux/tmux.plugin.zsh
source $OMZ_PLUGINS_DIR/tmuxinator/tmuxinator.plugin.zsh
source $OMZ_PLUGINS_DIR/ubuntu/ubuntu.plugin.zsh
source $OMZ_PLUGINS_DIR/vi-mode/vi-mode.plugin.zsh

source $OMZ_PLUGINS_DIR/z/z.plugin.zsh

### codeclimate, fzf, kube-ps1, nmap, procs...

