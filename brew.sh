#!/bin/bash
# Install Homebrew if needed.
set -e

CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURDIR/util.sh"

if ! which brew &> /dev/null; then
    report "Installing Homebrew..." YELLOW
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
