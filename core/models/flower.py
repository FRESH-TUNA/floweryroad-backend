from django.db import models
from django.db.models import Avg
from . import Purpose, Color, Language

class Flower(models.Model):
    SEASON = (
        (0, '봄'),
        (1, '여름'),
        (2, '가을'),
        (3, '겨울'),
    )
    name = models.CharField(max_length=20)
    description = models.TextField()
    season = models.IntegerField(default=1, choices=SEASON)
    languages = models.ManyToManyField(Language, related_name='flowers')
    colors = models.ManyToManyField(Color, related_name='flowers')
    purposes = models.ManyToManyField(Purpose, related_name='flowers')

    def __str__(self):
        return self.name
    