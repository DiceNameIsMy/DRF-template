FROM python:3.9.7-slim

# install initial dependencies
RUN apt-get update && \
    apt-get -y install libpq-dev gcc &&  \
    pip install --no-cache --upgrade pip poetry

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1 \
    PYTHONUNBUFFERED 1
ENV APP_HOME=/django

WORKDIR ${APP_HOME}

# install dependencies
COPY poetry.lock pyproject.toml ./
RUN poetry config virtualenvs.in-project true && \
    poetry install --no-dev

# copy entrypoints
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

# copy project
COPY src $APP_HOME

ENTRYPOINT [ "/django/entrypoint.sh" ]