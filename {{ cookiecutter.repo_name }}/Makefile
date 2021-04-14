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
PYTHON_INTERPRETER = {{ cookiecutter.python_interpreter }}

#################################################################################
# COMMANDS                                                                      #
#################################################################################

## Install Python Dependencies
requirements:
	poetry config virtualenvs.in-project true
	poetry install

add_jupyter_kernel:
	$(VENV)/python -m ipykernel install --user --name $(PROJECT_NAME)

## Make Dataset
data: requirements
	$(PYTHON_INTERPRETER) $(PROJECT_NAME)/data/make_dataset.py data/raw data/processed

process_data:

## Delete all compiled Python files
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete

#################################################################################
# PROJECT RULES                                                                 #
#################################################################################


