#!/bin/sh

poetry run ./manage.py migrate --no-input

poetry run gunicorn config.wsgi:application -c config/gunicorn.conf.py --bind 0.0.0.0:8000
