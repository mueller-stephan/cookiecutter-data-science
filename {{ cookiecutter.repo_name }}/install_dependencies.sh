#! /usr/bin/env bash

# Generate .zshrc file if not exits
touch ${ZDOTDIR-~}/.zshrc

{% if cookiecutter.use_direnv== 'yes' %}
# Install Direnv
if ! command -v direnv &>/dev/null; then
    echo "Install Direnv..."
    brew install direnv

    # Add hook to .zshrc
    printf "\n# Run direnv hook\n" >>${ZDOTDIR-~}/.zshrc
    echo "eval \"\$(direnv hook zsh )\"" >>${ZDOTDIR-~}/.zshrc
    source ${ZDOTDIR-~}/.zshrc
fi
{% endif %}

# Install Pyenv
if ! command -v pyenv &>/dev/null; then
    echo "Install Pyenv..."
    brew install pyenv

    # Add hook to .zshrc
    printf "\n# Run pyenv hook\n" >>${ZDOTDIR-~}/.zshrc
    echo 'eval "$(pyenv init --path)"' >>${ZDOTDIR-~}/.zshrc
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >>${ZDOTDIR-~}/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >>${ZDOTDIR-~}/.zshrc
    echo 'export PATH="$PYENV_ROOT/shims:$PATH"' >>${ZDOTDIR-~}/.zshrc

    source ${ZDOTDIR-~}/.zshrc
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

{% if cookiecutter.use_dvc == 'yes' %}
# Install DVC
if ! command -v dvc &>/dev/null; then
    echo "Install Poetry..."
    brew install dvc
fi
{% endif %}

# Install python version if not exists
# pyenv install -s {{ cookiecutter.python_version }}

# As C compiler on OSX is incompatible with CPython from 12.3 upwards, use gcc-11 installed via brew
# As soon as problems are fixed again, this should be reverted to standard pyenv install -s ...
brew install gcc
CC=/usr/local/bin/gcc-11 pyenv install -s {{ cookiecutter.python_version }}
