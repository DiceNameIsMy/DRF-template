.PHONY: dev-up dev-down local-up local-loaddata local-stop local-down local-down-clean

dev-up:
	docker-compose -f docker-compose.local.yaml up --build -d pg redis celeryworker
	poetry run ./src/manage.py runserver

dev-down:
	docker-compose -f docker-compose.local.yaml down

local-up:
	docker-compose -f docker-compose.local.yaml up --build

local-loaddata:  # currently not working
	cat fixtures/fixture.json | docker exec -i $(docker-compose -f docker-compose.local.yaml ps -q celeryworker) poetry run ./manage.py loaddata --format=json -

local-stop:
	docker-compose -f docker-compose.local.yaml stop

local-down:
	docker-compose -f docker-compose.local.yaml down

local-down-clean:
	docker-compose -f docker-compose.local.yaml down -v

makemigrations:
	python src/manage.py makemigrations
