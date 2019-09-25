from django.db import models
from . import Flower

class Birth(models.Model):
    date = models.DateField(unique=True)
    flower = models.ForeignKey(Flower, related_name='births', on_delete=models.CASCADE)
