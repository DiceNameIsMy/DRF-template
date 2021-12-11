#!/bin/sh

python manage.py migrate --no-input

exec "$@"