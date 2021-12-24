#!/bin/sh

poetry run ./manage.py migrate --no-input

poetry run ./manage.py runserver 0.0.0.0:8000
