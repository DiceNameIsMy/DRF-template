FROM python:3.9.6-slim

WORKDIR /django

# install psycopg2 dependencies
RUN apt-get update \
    && apt-get -y install libpq-dev gcc

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV APP_HOME=/django

# install dependencies
ADD requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# copy entrypoint.sh
ADD ./entrypoint.sh .
RUN sed -i 's/\r$//g' $APP_HOME/entrypoint.sh
RUN chmod +x $APP_HOME/entrypoint.sh

# copy project
COPY . .

# run entrypoint
ENTRYPOINT ["/django/entrypoint.sh"]