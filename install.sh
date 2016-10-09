#!/bin/bash

# Fail fast
set -euo pipefail

# Here
SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Utils used later (messages, message color)
source $SETUP_DIR/util.sh

report "Making ~/bin" YELLOW
mkdir -p ~/bin

# Install essential build tools
source $SETUP_DIR/build-essentials.sh

# Install Homebrew if needed
source $SETUP_DIR/brew.sh

# Git
brew install git git-lfs
git lfs install --force

# Powerline Meslo fonts
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

# Bash
brew install bash-completion bash-git-prompt

# Install links (hard b/c some script fails on symlink)
ln $PWD/bashrc ~/.bashrc
ln $PWD/bash_profile ~/.bash_profile
ln $PWD/iterm2_shell_integration.bash ~/.iterm2_shell_integration.bash
