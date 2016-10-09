#!/bin/bash
# Install essential build tools.
set -e

SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SETUP_DIR/util.sh

report 'Installing essential build tools...' YELLOW

# Check for Xcode
if ! which xcode-select &> /dev/null; then
    report 'Xcode not installed!  Install Xcode from the App store before proceeding' RED
    exit
fi

# Install command line tools if not already installed
xcode-select --install || true
