#!/bin/sh

poetry run ./manage.py migrate --no-input

exec "$@"
