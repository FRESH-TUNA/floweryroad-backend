import logging
from django.db import models
from . import Purpose, Color, Language

class Flower(models.Model):
    SEASON = (
        (0, '봄'),
        (1, '여름'),
        (2, '가을'),
        (3, '겨울'),
    )
    name = models.CharField(max_length=20)
    description = models.CharField(max_length=200)
    season = models.IntegerField(default=1, choices=SEASON)
    languages = models.ManyToManyField(Language, related_name='flowers')
    colors = models.ManyToManyField(Color, related_name='flowers')
    purposes = models.ManyToManyField(Purpose, related_name='flowers')
    
    @property
    def season_name(self):
        season_list = [x[1] for x in self.SEASON]
        return season_list[self.season]
    