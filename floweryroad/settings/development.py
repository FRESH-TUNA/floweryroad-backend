from .base import *
import json
DEBUG = True
# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

CONFIG_SECRET_DIR = os.path.join(BASE_DIR, '.credential')
CONFIG_SETTINGS_COMMON_FILE = os.path.join(CONFIG_SECRET_DIR, 'devDBCredential.json')
config_devdb_secret = json.loads(open(CONFIG_SETTINGS_COMMON_FILE).read())

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '3w#j4id+z(%si4cl+7)mu%rb5wx9)0l5w5ormf+4p(zn&7q!!s'

ROOT_URLCONF = 'floweryroad.urls.development'
#media 설정
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

MEDIA_URL = '/media/'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': config_devdb_secret['db']['NAME'],
        'USER': config_devdb_secret['db']['USER'],
        'PASSWORD': config_devdb_secret['db']['PASSWORD'],
        'HOST': config_devdb_secret['db']['HOST'],
        'PORT': config_devdb_secret['db']['PORT'],
    }
}