#!/bin/bash
set -euo pipefail
mkdir -p ~/bin

brew install bash-completion
ln -s $PWD/git-completion.bash ~/bin/git-completion.bash

ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash_profile ~/.bash_profile
