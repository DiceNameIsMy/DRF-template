FROM python:3.9.7-slim

# install psycopg2 dependencies
RUN apt-get update \
    && apt-get -y install libpq-dev gcc

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1 \
    PYTHONUNBUFFERED 1 \
    APP_HOME=/django \
    ENTRYPOINT="entrypoint.sh" \
    ENTRYPOINT_DIR="${APP_HOME}/${ENTRYPOINT}"

# create venv & use as default
ENV VENV_DIR=/venv
RUN python -m venv $VENV_DIR
ENV PATH="$VENV_DIR/bin:$PATH"

WORKDIR $APP_HOME

# install dependencies
ADD src/requirements.txt .
RUN pip install --upgrade pip wheel && pip install -r requirements.txt

# copy entrypoint.sh
ADD ./src/${ENTRYPOINT} .
RUN sed -i 's/\r$//g' ${ENTRYPOINT_DIR}
RUN chmod +x ${ENTRYPOINT_DIR}

# copy project
COPY src $APP_HOME

# run entrypoint
ENTRYPOINT ["/django/entrypoint.sh"]