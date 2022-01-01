# DRF-template

## Setup
### pre-commit hooks
1. poetry install
2. poetry run pre-commit install

## Docker
### Development
1. inside folder `env_conf/` remove `*-sample` ending from `.dev.env`
2. run `docker-compose up --build`

### Production
1. inside folder `env_conf/` remove `*-sample` ending from `.prod.env` and `.prod.db.env`
2. run `docker-compose -f docker-compose.prod.yml up --build`
