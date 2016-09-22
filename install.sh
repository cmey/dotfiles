#!/bin/bash
set -euo pipefail
mkdir -p ~/bin

brew install bash-completion
brew install bash-git-prompt

ln -s $PWD/bashrc ~/.bashrc
ln -s $PWD/bash_profile ~/.bash_profile
