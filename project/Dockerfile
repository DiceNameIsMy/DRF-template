FROM python:3.9

WORKDIR /app

ADD requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

RUN mkdir static/
RUN mkdir media/

RUN python manage.py migrate --noinput
RUN python manage.py collectstatic --noinput


EXPOSE 8000

CMD ["gunicorn", "config.wsgi", "-c", "config/gunicorn.conf.py"]
