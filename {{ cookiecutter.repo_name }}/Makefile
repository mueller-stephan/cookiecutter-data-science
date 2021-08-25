.PHONY: clean data lint requirements process_data add_jupyter_kernel

#################################################################################
# GLOBALS                                                                       #
#################################################################################

ENVNAME := .venv
VENV := $(ENVNAME)/bin

RAW_DATA = data/raw
INTERIM_DATA = data/interim
PRCOESSED_DATA = data/processed

PROJECT_NAME = {{ cookiecutter.repo_name }}
PYTHON_INTERPRETER = $(VENV)/bin/python

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
	poetry install

add_jupyter_kernel:
	$(VENV)/python -m ipykernel install --user --name $(PROJECT_NAME)

## Make Dataset
data: requirements
	$(PYTHON_INTERPRETER) src/data/make_dataset.py data/raw data/processed

process_data:

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
	pytest tests

#################################################################################
# PROJECT RULES                                                                 #
#################################################################################


