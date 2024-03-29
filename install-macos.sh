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
git config --global user.email christophe.meyer.pro@gmail.com
#git config user.email cmeyer@butterflynetinc.com  # in software
git config --global commit.gpgsign true
git config --global user.signingkey 04D468907A831621
#git config user.signingkey 1E8DF5A73DEA3CB7  # cmeyer@butterflynetinc.com
git config --global credential.helper osxkeychain
git config --global push.default current  # auto set upstream when pushing a new branch

git lfs install --force
# git pullall  # pull and update submodules
git config --global alias.su '!f(){ git submodule --quiet sync && git submodule update --init --recursive; }; f'
git config --global alias.pullall '!f(){ git pull "$@" && git su; }; f'
# git lg  # prettier git log
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global color.ui auto
git config --global fetch.prune true  # prune deleted remotes automatically on each pull or fetch
git config --global rerere.enabled true
git config --global core.excludesfile "$PWD/gitignore-global"
git config --global diff.noprefix true  # remove a/ b/ in front of origin and destination paths

# Powerline Meslo fonts
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

# Bash
brew install bash-completion bash-git-prompt

# Utils
brew install gcc
brew link gcc # not linked by default, r needs it
brew install blitz cheat cmake ctags findutils fzf gifsicle glances gpg grip htop imagemagick mas mplayer postgresql ranger r stow tmux tree zsh zsh-syntax-highlighting
brew install vim
# Utils in Rust
brew install fd ripgrep sd
brew cask install angry-ip-scanner dash disk-inventory-x docker dropbox dropbox-encore evernote gpg-suite hex-fiend iterm2 julia meld openoffice pycharm-ce rescuetime rstudio skype slack spectacle transmission vlc zotero

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

# zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -f ~/.zshrc ~/.zshrc.pre-oh-my-zsh
# zsh setup as default shell
shell_path=/usr/local/bin/zsh
if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    sudo sh -c "echo $shell_path >> /etc/shells"
fi
chsh -s "$shell_path"

# Install (sym)links
stow shell bin vim python julia iterm tmux --target=$HOME

# fzf setup
/usr/local/opt/fzf/install  # install fzf bash extensions (modifies bash history feature w/ Ctrl-R)

# Vim setup
vim -c PlugInstall  # Install vim plugins (configured in vimrc)

