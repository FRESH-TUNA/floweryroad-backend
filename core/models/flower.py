import logging
from django.db import models
from . import Purpose, Color, Language

class Flower(models.Model):
    SEASON = (
        (0, 'Spring'),
        (1, 'Summer'),
        (2, 'Fall'),
        (3, 'Winter'),
    )
    name = models.CharField(max_length=20)
    description = models.CharField(max_length=200)
    season = models.IntegerField(default=1, choices=SEASON)
    languages = models.ManyToManyField(Language, related_name='flowers')
    colors = models.ManyToManyField(Color, related_name='flowers')
    purposes = models.ManyToManyField(Purpose, related_name='flowers')
    