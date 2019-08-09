import floweryroad.settings.base as settings
from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from . import Purpose, Color, Language, Flower


class Comment(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    flower = models.ForeignKey(Flower, on_delete=models.CASCADE)
    content = models.CharField(max_length=200, blank=True)
    star = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(5.0)], default=0.0)
    created_at = models.DateTimeField(auto_now=True)
    