FROM python:3.9.6-alpine

WORKDIR /django

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV APP_HOME=/django

# install dependencies
ADD requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# copy entrypoint.sh
ADD ./entrypoint.sh .
RUN sed -i 's/\r$//g' $APP_HOME/entrypoint.sh
RUN chmod +x $APP_HOME/entrypoint.sh

# copy project
COPY . .

RUN mkdir static/
RUN mkdir media/

# run entrypoint.sh
ENTRYPOINT ["/django/entrypoint.sh"]