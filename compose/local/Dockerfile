FROM python:3.9.9-slim

# install initial dependencies
RUN apt-get update && \
    apt-get -y install libpq-dev gcc gdal-bin &&  \
    pip install --no-cache --upgrade pip poetry

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1 \
    PYTHONUNBUFFERED 1
ENV APP_HOME=/app

# install dependencies
COPY poetry.lock pyproject.toml /app/
RUN poetry config virtualenvs.in-project true \
    && cd /app \
    && poetry install --no-dev

# project source is included via volume
WORKDIR ${APP_HOME}/src
