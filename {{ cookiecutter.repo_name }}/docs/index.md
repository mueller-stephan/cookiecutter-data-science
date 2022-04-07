{{cookiecutter.project_name}}
==============================

{{cookiecutter.description}}

**Client:** {{ cookiecutter.client_name }}

**Project duration:** << duration >> months

**Status:** << status >>

## Contact

**statworx:**

| Name            | Mail                         | Role                         |
| --------------- | ---------------------------- | ---------------------------- |
| {{ cookiecutter.author_name}} | {{ cookiecutter.author_email }} | Role |
| {{ cookiecutter.author_name}} | {{ cookiecutter.author_email }} | Role |
| {{ cookiecutter.author_name}} | {{ cookiecutter.author_email }} | Role |

## Overview

### Abstract

<< Abstract >>

### Folder structure


### Technologies

#### One-Time Setup

Install Pyenv

```console
$ brew update
```

```console
$ brew install pyenv
```

Install Poetry

```console
$ curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
```

And force Poetry to install the virtual environment in the project folder

```console
$ poetry config virtualenvs.in-project true
```

Creates virtual environment and installs all dependencies and the project itself,
navigate into the folder with the file poetry.lock, and execute:

```console
$ poetry install
```

From now on, execute every command in the newly created virtual environment.

Show documentation in browser

```console
$ make documentation
```

#### Execute Complete Pipeline

A end-to-end pipeline run including model training, model evaluation, special discount
budget optimization and campaign suggestions is executed with the following command:

```console
$ poetry run test
```

## Project details

### **Folder Structure**

	 ├── LICENSE
	 ├── README.md             <- The top-level README for developers using this project.
	 │
	 ├── Makefile              <- Makefile with commands like `make data` or `make train`.
	 │
	 ├── Dockerfile            <- Docker with instructions for the project container.
	 ├── .dockerignore         
	 │
	 ├── .env                  <- Dotenv file environemt variables.
	 ├── .envrc                <- Dirvenv config file that automatically loads the virual 
	 │                            environ and environment variables into the shell.
	 │
	 ├── .gitignore
	 │
	 ├── .pre-commit-config.yaml <- List of git pre-commit hook.
	 │
	 ├── mkdocs.yml            <- Configuration for mkDocs
	 ├── .flake8               <- Configuration for iflake8
	 ├── mypy.ini              <- Configuration for mypy
	 ├── pyproject.toml        <- List of python dependecies
	 │
	 ├── .vscode               <- Configuration for VsCode
	 ├── {{ cookiecutter.repo_name }}.code-workspace
	 │
	 ├── data                  
	 │   ├── external          <- Data from third party sources.
	 │   ├── interim           <- Intermediate data that has been transformed.
	 │   ├── processed         <- The final, canonical data sets for modeling.
	 │   └── raw               <- The original, immutable data dump.
	 │
	 ├── docs                  <- Documentation Source for MkDocs
	 │
	 ├── notebooks             <- Jupyter notebooks. Naming convention is a number (for ordering),
	 │                            the creator's initials, and a short `-` delimited description, e.g.
	 │                            `1.0-jqp-initial-data-exploration`.
	 │                            `1.0-jqp-initial-data-exploration`.
	 │
	 ├── reports               <- Generated analysis as HTML, PDF, LaTeX, etc.
	 │   └── figures           <- Generated graphics and figures to be used in reporting
	 │
	 ├── tests
	 └── src                <- Source code for use in this project.
		 │
	     ├── data           <- Scripts to download or generate data
	     │   └── make_dataset.py
		 │
	     ├── features       <- Scripts to turn raw data into features for modeling
	     │   └── build_features.py
		 │
	     ├── models         <- Scripts to train models and then use trained models to make
		 │   │                 predictions
	     │   ├── predict_model.py
	     │   └── train_model.py
		 │
	     └── visualization  <- Scripts to create exploratory and results oriented visualizations
	         └── visualize.py


### **Commit Message Conventions**

Every Commit Message consits of two parts (<https://www.freecodecamp.org/news/level-you-up-to-awesome-commit-messages-a85558cb90e8/>).
The **first** part indicates to which part of a project the commit belongs to e.g.
Modeling or Shiny App and gives a short description of the changes made

The following abbreviations are used:

<code>commit -m  "Tag 1:Tag 2  MESSAGE"</code>

<code>commit -m "MOD:ENH Added linear regression to toolstack"</code>

Where to commit? (Tag 1)

- **PPL**   - Pipeline
- **MOD**   - Model related
- **SEL**   - Feature selection
- **EXP**   - Exploration
- **DAT**   - Data related
- **ORG**   - Organisation
- **DEP**   - Deployment related

What to commit? (Tag 2)

- **ICM** - Initial Commit of New Script/Class/Function
- **DEL** - Delete Script/Function/Class
- **BFX** - Bugfix
- **ENH** - Enhancement
- **REF** - Reformat/Pretty Code

### **Used technologies**

- Python
- Poetry
- Hydra
- Pandas
- Numpy



--------

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>
