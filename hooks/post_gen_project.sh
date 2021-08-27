#! /usr/bin/env sh

# Install dependencies
make install_dependencies

# Set local python version
pyenv local {{ cookiecutter.python_version }}
export PYENV_VERSION="{{ cookiecutter.python_version }}"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"

# Initate Git Repo
git init
{% if cookiecutter.git_repo != '' %}
git remote add origin {{ cookiecutter.git_repo }}
{% endif %}

# Update Precommit
pre-commit autoupdate
make setup

{% if cookiecutter.use_docker == 'no' %}
rm Dockerfile
rm .dockerignore
rm docker-compose.yml
{% endif %}

# Init Hydra Config
{% if cookiecutter.use_hydra == 'no' %}
rm src/cli.py
rm docs/code/cli.md
rm -r src/configurations
{% endif %}

# Init dvc Config
{% if cookiecutter.use_dvc == 'yes' %}
dvc init
{% endif %}

{% if cookiecutter.use_direnv == 'yes' %}
command -v direnv && direnv allow
{% else %}
rm .envrc
{% endif %}
