#!/bin/bash

# Fail fast
set -euo pipefail

# Here
SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SETUP_DIR

# Utils used later (messages, message color)
source $SETUP_DIR/util.sh

report "Making ~/bin/" YELLOW
mkdir -p ~/bin/

# Install essential build tools
source $SETUP_DIR/build-essentials.sh

# Install Homebrew if needed
source $SETUP_DIR/brew.sh

# Git (install & configure)
brew install git git-lfs hub
git config --global user.name "Christophe Meyer"
git config --global user.email cmeyer@butterflynetinc.com
git config --global commit.gpgsign true
git config --global user.signingkey 04D468907A831621
#git config user.signingkey 1E8DF5A73DEA3CB7  # cmeyer@butterflynetinc.com
git config --global credential.helper osxkeychain
git config --global push.default current  # auto set upstream when pushing a new branch

git lfs install --force
# git pullall  # pull and update submodules
git config --global alias.pullall '!f(){ git pull "$@" && git submodule update --init --recursive; }; f'
# git lg  # prettier git log
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global color.ui auto
git config --global fetch.prune true  # prune deleted remotes automatically on each pull or fetch
git config --global rerere.enabled true
git config --global core.excludesfile "$PWD/gitignore-global"

# Powerline Meslo fonts
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

# Bash
brew install bash-completion bash-git-prompt

# Utils
brew install gcc
brew link gcc  # not linked by default, r needs it
brew install bash-completion cheat ctags findutils fzf gpg htop imagemagick mas mplayer postgresql r ripgrep tmux tree
brew install vim --with-lua
brew cask install  angry-ip-scanner dash disk-inventory-x docker dropbox dropbox-encore evernote gpg-suite hex-fiend iterm2 julia meld pycharm-ce rescuetime rstudio skype slack spectacle transmission vlc zotero

# Install extra bash completions
# Docker
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion /usr/local/etc/bash_completion.d/docker
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion /usr/local/etc/bash_completion.d/docker-machine
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion /usr/local/etc/bash_completion.d/docker-compose

# Vim folders
report "Making ~/.vim/" YELLOW
mkdir -p ~/.vim/
mkdir -p ~/.vim/files/backup/
mkdir -p ~/.vim/files/swap/
mkdir -p ~/.vim/files/undo/
mkdir -p ~/.vim/files/info/
mkdir -p ~/.vim/autoload

# Install links (sym)
ln -sf $PWD/bashrc ~/.bashrc
ln -sf $PWD/bash_profile ~/.bash_profile
ln -sf $PWD/env-butterfly.sh ~/bin/
ln -sf $PWD/vimrc ~/.vim/vimrc
ln -sf $PWD/pdbrc ~/.pdbrc
ln -sf $PWD/juliarc.jl ~/.juliarc.jl
ln -sf $PWD/pythonrc.py ~/.pythonrc.py
ln -sf $PWD/iterm2_shell_integration.bash ~/.iterm2_shell_integration.bash
#ln -sf $PWD/custom.css ~/.jupyter/custom/custom.css  # dark Jupyter

# fzf setup
/usr/local/opt/fzf/install  # install fzf bash extensions (modifies bash history feature w/ Ctrl-R)

# Vim setup
vim -c PlugInstall  # Install vim plugins (configured in vimrc)
