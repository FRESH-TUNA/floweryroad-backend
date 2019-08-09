from django.db import models
from django.conf import settings
from . import Flower

class Image(models.Model):
    url = models.ImageField()
    flower = models.ForeignKey(Flower, on_delete=models.SET_NULL, null=True, blank=True, related_name='images')
