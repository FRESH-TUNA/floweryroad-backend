from django.conf import settings
from .base import *
import os

DEBUG = True

SECRET_KEY = os.environ['SECRET_KEY']

ROOT_URLCONF = 'floweryroad.urls.docker_production'

ALLOWED_HOSTS = [os.environ['WEB_HOST']]

CORS_ORIGIN_WHITELIST = [
    "http://floweryroad.herokuapp.com",
]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': os.environ['DB_NAME'],
        'USER': os.environ['DB_USER'],
        'PASSWORD': os.environ['DB_PASSWORD'],
        'HOST': os.environ['DB_HOST'],
        'PORT': os.environ['DB_PORT']
    }
}

STATIC_ROOT = os.path.join(BASE_DIR, 'static')
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

MEDIA_URL = os.environ['MEDIA']