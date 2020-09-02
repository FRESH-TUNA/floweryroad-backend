from .base import *
import os
DEBUG = True

INSTALLED_APPS = INSTALLED_APPS + [
    'debug_toolbar'
]

MIDDLEWARE = MIDDLEWARE + [
    'debug_toolbar.middleware.DebugToolbarMiddleware'
]

INTERNAL_IPS = ('172.19.0.1',)

# CONFIG_SECRET_DIR = os.path.join(BASE_DIR, '.credential')
# CONFIG_SETTINGS_COMMON_FILE = os.path.join(CONFIG_SECRET_DIR, 'devDBCredential.json')
# config_devdb_secret = json.loads(open(CONFIG_SETTINGS_COMMON_FILE).read())
# SECURITY WARNING: keep the secret key used in production secret!

ROOT_URLCONF = 'config.urls.development'

#media 설정
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

import logging.config
import os

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
        },
    },
    'root': {
        'handlers': ['console'],
        'level': 'WARNING',
    },
}
