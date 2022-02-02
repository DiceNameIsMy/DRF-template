# DRF-template
DRF-template

## Setup

### Development

Pyenv or python 3.9 is required

    pyenv install 3.9.9
    pyenv local 3.9.9
    python -m pip install poetry
    python -m poetry install
    poetry run pre-commit install

### Containers

#### Dev
Load everything in container except for the api. It will be loaded locally with hot-reload mode

remove `-sample` prefix from `.env-sample` and `.db.env-sample` in `compose/local/` folder

    make dev-up

#### Local
Load everything in container including api

remove `-sample` prefix from `.env-sample` and `.db.env-sample` in `compose/local/` folder


    make local-up
