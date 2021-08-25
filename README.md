# Cookiecutter Data Science

_A logical, reasonably standardized, but flexible project structure for doing and sharing data science work following the STATWORX coding standards. This project was forked from [cookiecutter-data-science](https://github.com/drivendata/cookiecutter-data-science)_

### Requirements to use the cookiecutter template:
-----------

- Homebrew
- xcode-select
- Cookiecutter

Run the following two commands in the shell to install the requirements:

```console
$  xcode-select --install
$  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/STATWORX/intern-cookiecutter-python-project/master/install.sh )"
```

### To start a new project, run:
------------

```console
$ cookiecutter https://github.com/STATWORX/intern-cookiecutter-python-project
```

### Tools
------------
The tools that are installed with the Cookiecutter template are:

- Poetry
- Direnv
- Pyenv
- Pre-Commit
- (Optional) Hydra
- (Optional) DVC