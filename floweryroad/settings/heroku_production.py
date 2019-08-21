from django.conf import settings
from .base import *
import os
import dj_database_url

DEBUG = False

SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY')

ROOT_URLCONF = 'floweryroad.urls.heroku_production'

ALLOWED_HOSTS = [
    'floweryroadapi.herokuapp.com',
]

CORS_ORIGIN_WHITELIST = [
    "https://floweryroad.herokuapp.com",
]

MIDDLEWARE += [
    'whitenoise.middleware.WhiteNoiseMiddleware',
]

DATABASES = {
    'default': {}
}

db_from_env = dj_database_url.config(conn_max_age=500)
DATABASES['default'].update(db_from_env)

STATIC_ROOT = os.path.join(BASE_DIR, 'static')

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'