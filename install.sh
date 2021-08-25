#! /usr/bin/env bash

###########################################################
# REQUIREMENTS:
# * xcode-select
###########################################################

# Install Homebrew <https://brew.sh/index_de>
if ! command -v brew &>/dev/null; then
    echo "Install Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    # Update Homebrew
    brew update
fi

# Install Cookiecutter
if ! command -v cookiecutter &>/dev/null; then
    brew install cookiecutter
fi
