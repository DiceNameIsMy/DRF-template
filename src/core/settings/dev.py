from .base import *  # noqa


DEBUG = True

ALLOWED_HOSTS = []

CORS_ALLOW_ALL_ORIGINS = True

DATABASES = {
    "default": {
        "ENGINE": "django.contrib.gis.db.backends.postgis",
        "HOST": "localhost",
        "PORT": "5433",
        "NAME": "postgres",
        "USER": "user",
        "PASSWORD": "pass",
    }
}

REDIS_HOST = "localhost"
REDIS_PORT = "6380"
REDIS_TASK_DB = "0"
REDIS_RESULT_DB = "1"

CELERY_BROKER_URL = f"redis://{REDIS_HOST}:{REDIS_PORT}/{REDIS_TASK_DB}"
CELERY_RESULT_BACKEND = f"redis://{REDIS_HOST}:{REDIS_PORT}/{REDIS_RESULT_DB}"

CELERY_TASK_TRACK_STARTED = True

CELERY_TIMEZONE = TIME_ZONE  # noqa
CELERY_ACCEPT_CONTENT = ["application/json"]
CELERY_TASK_SERIALIZER = "json"
CELERY_RESULT_SERIALIZER = "json"
