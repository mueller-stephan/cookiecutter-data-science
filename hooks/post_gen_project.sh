#! /usr/bin/env sh
git init
{% if cookiecutter.git_repo != '' %}
git remote add origin {{ cookiecutter.git_repo }}
{% endif %}

pre-commit autoupdate
make setup
command -v direnv && direnv allow
