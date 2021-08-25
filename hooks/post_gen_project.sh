#! /usr/bin/env sh

# Install python version if not exists
pyenv install -s {{ cookiecutter.python_version }}

# Set local python version
pyenv local {{ cookiecutter.python_version }}

export PYENV_VERSION="{{ cookiecutter.python_version }}"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

echo "$(pyenv init -)"
which python | xargs echo
pyenv local | xargs echo
echo $PATH | xargs echo

# Initate Git Repo
git init
{% if cookiecutter.git_repo != '' %}
git remote add origin {{ cookiecutter.git_repo }}
{% endif %}

# Update Precommit
pre-commit autoupdate
make setup
command -v direnv && direnv allow

# Init Hydra Config
{% if cookiecutter.use_hydra == 'no' %}
rm src/cli.py
rm docs/code/cli.md
rm -r src/configurations
{% endif %}

# Init Hydra Config
{% if cookiecutter.use_dvc == 'yes' %}
dvc init
{% endif %}
