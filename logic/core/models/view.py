from django.db import models
from django.utils import timezone
import config.environments.base as settings
from . import Flower

class View(models.Model):
    flower = models.ForeignKey(Flower, related_name='views', on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='views', on_delete=models.CASCADE)
    view_at = models.DateTimeField(auto_now_add=True)
