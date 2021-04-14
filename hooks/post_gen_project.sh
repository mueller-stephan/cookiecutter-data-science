#! /usr/bin/env sh
git init
pre-commit autoupdate
pre-commit install

make requirements add_jupyter_kernel