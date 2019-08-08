from .base import *

DEBUG = True
# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '3w#j4id+z(%si4cl+7)mu%rb5wx9)0l5w5ormf+4p(zn&7q!!s'

ROOT_URLCONF = 'floweryroad.urls.development'
#media 설정
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

MEDIA_URL = '/media/'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'floweryroaddev',
        'USER': 'floweryroadadmin',
        'PASSWORD': 'floweryroad1234',
        'HOST': '0.tcp.ngrok.io',
        'PORT': '',
    }
}