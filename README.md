# DRF-template

## Setup
### Development
1. inside folder `env_conf/` remove `*-sample` ending from `.dev.env`
2. run `docker-compose up --build`

### Production
1. inside folder `env_conf/` remove `*-sample` ending from `.prod.env` and `.prod.db.env`
2. run `docker-compose -f docker-compose.prod.yml up --build`
