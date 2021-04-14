#! /usr/bin/env sh
git init
pre-commit autoupdate
pre-commit install
pre-commit install --install-hooks 

make requirements add_jupyter_kernel