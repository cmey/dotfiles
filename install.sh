#!/bin/bash
# Fail fast
set -euo pipefail
# Here
SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Utils used later (messages, message color)
source $SETUP_DIR/util.sh

mkdir -p ~/bin

# Homebrew
if ! which brew &> /dev/null; then
    report "Installing Homebrew..." YELLOW
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew install bash-completion
brew install bash-git-prompt

# Powerline Meslo fonts
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

# Install links (hard b/c some script fails on symlink)
ln $PWD/bashrc ~/.bashrc
ln $PWD/bash_profile ~/.bash_profile
ln $PWD/iterm2_shell_integration.bash ~/.iterm2_shell_integration.bash
