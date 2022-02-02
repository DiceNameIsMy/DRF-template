.PHONY: dev-up dev-down local-up local-down

dev-up:
	docker-compose -f docker-compose.local.yaml up --build -d pg redis celeryworker
	poetry run ./src/manage.py runserver

dev-down:
	docker-compose -f docker-compose.local.yaml down

local-up:
	docker-compose -f docker-compose.local.yaml up --build

local-down:
	docker-compose -f docker-compose.local.yaml down
