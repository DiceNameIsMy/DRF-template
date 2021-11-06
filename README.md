# DRF-template

## Setup
### Devepopment
1. rename `.env.dev-sample` to `.env.dev`
2. update .env files and `docker-compose.yml` if you want
2. run `docker-compose up --build`

### Production
1. rename `.env.prod-sample` and `.env.prod.db-sample` to `.env.prod` and `.env.prod.db`
2. update .env files and `docker-compose.prod.yml` if you want
2. run `docker-compose -f docker-compose.prod.yml up --build`

