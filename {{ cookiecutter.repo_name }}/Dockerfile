### Base Image
FROM python:3.9.6-slim-buster as base

# Python settings
ENV PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1

WORKDIR /app

### Build Image
FROM base as builder

# Python settings
ENV PIP_DEFAULT_TIMEOUT=100 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    POETRY_VERSION=1.1.6

# Install Poetry
RUN pip install "poetry==$POETRY_VERSION"

# Create virtual environment
RUN python -m venv /venv

# Install python development dependencies
# RUN apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends build-essential python3-dev && apt-get clean

# Install dependencies into virtual environment
COPY pyproject.toml poetry.lock ./
RUN poetry export --no-ansi --no-interaction --without-hashes --format requirements.txt | /venv/bin/pip install --pre -r /dev/stdin

# Install app
COPY . .
RUN poetry build --no-ansi --no-interaction --format wheel && /venv/bin/pip install dist/*.whl


### Final Image
FROM base as final

# Install notification dependencies
RUN apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends libnotify-bin && apt-get clean

# Copy virtual environment with app and dependencies
COPY --from=builder /venv /venv

# Activate virtual environment
ENV VIRTUAL_ENV=/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Run as non-root user
RUN useradd --create-home --no-log-init appuser
USER appuser

# Set workdir
WORKDIR /home/appuser

# Execute command
CMD ["test"]
