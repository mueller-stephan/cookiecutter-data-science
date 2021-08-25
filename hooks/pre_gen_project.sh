#! /usr/bin/env bash

# Install Homebrew <https://brew.sh/index_de>
if ! command -v brew &>/dev/null; then
    echo "Install Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    # Update Homebrew
    brew update
fi

# Install Direnv
if ! command -v direnv &>/dev/null; then
    echo "Install Direnv..."
    brew install direnv

    # Add hook to .zshrc
    printf "\n# Run direnv hook" >>"${ZDOTDIR-~}/.zshrc"
    echo "eval \"\$(direnv hook zprintf )\"" >>"${ZDOTDIR-~}/.zshrc"
    source "${ZDOTDIR-~}/.zshrc"
fi

# Install Pyenv
if ! command -v pyenv &>/dev/null; then
    echo "Install Pyenv..."
    brew install pyenv

    # Add hook to .zshrc
    printf "\n# Run pyenv hook" >>"${ZDOTDIR-~}/.zshrc"
    echo 'eval "$(pyenv init --path)"' >>"${ZDOTDIR-~}/.zshrc"
    source "${ZDOTDIR-~}/.zshrc"
fi

# Install pre-commit
if ! command -v pre-commit &>/dev/null; then
    echo "Install Pre-Commit..."
    brew install pre-commit
fi

# Install Poetry
if ! command -v poetry &>/dev/null; then
    echo "Install Poetry..."
    brew install poetry
fi

# Install DVC
if ! command -v dvc &>/dev/null; then
    echo "Install Poetry..."
    brew install dvc
fi
