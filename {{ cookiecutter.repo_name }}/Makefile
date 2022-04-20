.PHONY: clean data requirements process_data add_jupyter_kernel run_tests documentation install_dependencies

#################################################################################
# GLOBALS                                                                       #
#################################################################################

ENVNAME := .venv
VENV := $(ENVNAME)/bin

RAW_DATA = data/raw
INTERIM_DATA = data/interim
PRCOESSED_DATA = data/processed

PROJECT_NAME = {{ cookiecutter.repo_name }}
PYTHON_INTERPRETER = $(VENV)/python

NOTEBOOKS = notebooks
REPORTS = reports
ALL_NOTEBOOKS = $(wildcard $(NOTEBOOKS)/*.ipynb)
ALL_REPORTS = $(patsubst $(NOTEBOOKS)/%.ipynb,$(REPORTS)/%.html,$(ALL_NOTEBOOKS))

#################################################################################
# COMMANDS                                                                      #
#################################################################################

setup: pre-commit install_venv add_jupyter_kernel

## Install Python Dependencies
install_venv:
	poetry config virtualenvs.in-project true
	poetry env use $(shell pyenv which python)
	poetry install

add_jupyter_kernel:
	$(VENV)/python -m ipykernel install --user --name $(PROJECT_NAME)

pre-commit:
	pre-commit install
	pre-commit install --install-hooks

## Delete all compiled Python files
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete

## Render notebooks to html
$(REPORTS)/%.html: $(NOTEBOOKS)/%.ipynb
	jupyter nbconvert --to html --no-input --no-prompt --execute --output-dir reports $<

all_reports: $(ALL_REPORTS)

run_tests:
	$(PYTHON_INTERPRETER) -m pytest tests

code_documentation:
	sphinx-apidoc -o docs/source/code src

build_html_docs:
	sphinx-build -M html ./docs ./docs/build

build_pdf_docs:
	sphinx-build -M latexpdf ./docs ./docs/build

# TODO: Update containerization workflow
container:
	docker build -t {{ cookiecutter.repo_name }}:latest .

install_dependencies:
	# run install script
	bash ./install_dependencies.sh

#################################################################################
# PROJECT RULES                                                                 #
#################################################################################
