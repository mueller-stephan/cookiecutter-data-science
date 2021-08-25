#! /usr/bin/env bash

# Generate .zshrc file if not exits
touch ${ZDOTDIR-~}/.zshrc

# Install Direnv
if ! command -v direnv &>/dev/null; then
    echo "Install Direnv..."
    brew install direnv

    # Add hook to .zshrc
    printf "\n# Run direnv hook\n" >>${ZDOTDIR-~}/.zshrc
    echo "eval \"\$(direnv hook zsh )\"" >>${ZDOTDIR-~}/.zshrc
    source ${ZDOTDIR-~}/.zshrc
fi

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
