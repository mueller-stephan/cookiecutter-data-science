# Cookiecutter for STATWORX Python Projects 

_A logical, reasonably standardized, but flexible project structure for doing and sharing data science work following the STATWORX coding standards. This project was forked from [cookiecutter-data-science](https://github.com/drivendata/cookiecutter-data-science)._

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

- [Poetry](https://python-poetry.org) - Package Manager
- [Direnv](https://direnv.net) - Shell Environment Manager
- [Pyenv](https://github.com/pyenv/pyenv) - Python Version Manager
- [Pre-Commit](https://pre-commit.com) - Git Pre Commit Hooks
- [Flake8](https://flake8.pycqa.org/en/latest/) - Linter
- [Pytest](https://docs.pytest.org) - Testing
- [Black](https://black.readthedocs.io/en/stable/) - Formatting
- [MyPy](https://mypy.readthedocs.io/en/stable/) - Static Typing
- [Isort](https://pycqa.github.io/isort/) - Import Sorter
- [MkDocs](https://www.mkdocs.org) - Documentatoin
- (Optional) [Hydra](https://hydra.cc) - Orchestration
- (Optional) [DVC](https://dvc.org) - Data Versioning