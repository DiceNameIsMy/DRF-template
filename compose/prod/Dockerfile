FROM python:3.9.9-slim

# install initial dependencies
RUN apt-get update && \
    apt-get -y install libpq-dev gcc gdal-bin &&  \
    pip install --no-cache --upgrade pip poetry

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1 \
    PYTHONUNBUFFERED 1
ENV APP_HOME=/app

WORKDIR ${APP_HOME}

# create the app user
RUN addgroup app && useradd -g app app && \
    chown -R app:app ${APP_HOME}

# install dependencies
COPY poetry.lock pyproject.toml ./
RUN poetry config virtualenvs.in-project true && \
    poetry install --no-dev

# copy project
COPY src $APP_HOME/src

# change to the app user
USER app
