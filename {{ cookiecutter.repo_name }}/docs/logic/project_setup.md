# Project Setup

## Pyenv

It is recommendet to use Pyenv to install the required Python version.

`brew update`

`brew install pyenv`

Pyenv should automatically pick up the right Python version from the `.python-version` file.

## Poetry

Install Poetry

`curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python`

And force Poetry to install the virtual environment in the project folder

`poetry config virtualenvs.in-project true`

Creates virtual environment and installs all dependencies and the project itself,
navigate into the folder with the file poetry.lock, and execute:

`poetry install`

## Documentation

The code is documented via [mkdocs](https://www.mkdocs.org/) with the extension [mkdosctrings](https://mkdocstrings.github.io/). To generate the documentation the command `mkdocs build` must be used. To open the documentation in the browser the command `mkdocs serve` can be used. To implement new parts of documentation in the report adapt nav section in the `mkdocs.yml` file. A detailed description of the description can be found in the usage description of the mkdocstrings package.

## Pre-Commit

Pre commit hooks are used to lint the code and to strip output from commited Jupyter Notebooks. The tool can be installed by using `brew install pre-commit`. To implement pre-commit into your git hooks use `pre-commit install`. To check once against all files `pre-commit run --all-files`. The hooks can be edited in the file `.pre-commit-config.yaml`.

## Execute the project

Run project via Poetry

`poetry run entry_point`

## Possible Errors

### Problems with outdated pip version

Upgrade pip within the virtual environment.

`poetry run pip install --upgrade pip`

### Problems while creating/upgrading the virtual environment

On macOS, there are currently, as of 1st of March 2021, two bugs that might prevent the
virtual environment from upgrading/installing correctly. Firstly, pip tries to install
Numpy from scratch instead of using the pre-build wheels. Secondly, building Numpy
from scratch is currently not possible due to wrongly linked libraries (See
[Issue 17794](https://github.com/numpy/numpy/issues/17784)). The solution is to install
numpy manually. Poetry will respect a previously installed version.

- Delete `poetry.lock` and the virtual environment (`.venv`)
- Create a new empty virtual environment with Poetry: `poetry env use YOURPYTHONVERSION`
- Upgrade pip inside the new environment: `poetry run pip install --upgrade pip`
- Install pre-build Numpy wheel: `poetry run pip install --only-binary=:all: numpy==1.19.4`
- Install the remaining dependencies: `poetry install`

### Problems with clang

On macOS, there is an issue with the clang build environment after upgrading to macOS Big Sure. This
affects, in particular, the SHAP package. The following command should help:

`sudo xcode-select --switch /Library/Developer/CommandLineTools`

For more information refer to that [stackoverflow post](https://stackoverflow.com/questions/63972113/big-sur-clang-invalid-version-error-due-to-macosx-deployment-target).
