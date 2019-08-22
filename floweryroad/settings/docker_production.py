from django.conf import settings
from .base import *
import os, json

CONFIG_SECRET_DIR = os.path.join(BASE_DIR, '.credential')
CONFIG_SETTINGS_COMMON_FILE = os.path.join(CONFIG_SECRET_DIR, 'credentials.json')
config_secret = json.loads(open(CONFIG_SETTINGS_COMMON_FILE).read())

DEBUG = False

SECRET_KEY = config_secret['SECRET_KEY']

ROOT_URLCONF = 'floweryroad.urls.docker_production'

ALLOWED_HOSTS = [
    '127.0.0.1',
]

CORS_ORIGIN_WHITELIST = [
    "http://localhost:3000",
]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': config_secret['db']['NAME'],
        'USER': config_secret['db']['USER'],
        'PASSWORD': config_secret['db']['PASSWORD'],
        'HOST': config_secret['db']['HOST'],
        'PORT': config_secret['db']['PORT'],
    }
}

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.postgresql_psycopg2',
#         'NAME': 'floweryroad',
#         'USER': 'floweryroad',
#         'PASSWORD': '1234',
#         'HOST': 'db',
#         'PORT': '5432',
#     }
# }

STATIC_ROOT = os.path.join(BASE_DIR, 'static')
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = 'http://127.0.0.1/media/'