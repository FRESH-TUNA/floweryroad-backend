import config.environments.base as settings
from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from . import Purpose, Color, Language, Flower
import logging

class Comment(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    flower = models.ForeignKey(Flower, on_delete=models.CASCADE, related_name='comments')
    content = models.CharField(max_length=200, blank=True)
    star = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(5.0)], default=0.0)
    created_at = models.DateTimeField(auto_now=True)

    @property
    def like(self):
        #좋아요를 취소하면 반드시 지운다고 가정하여 설계했음
        return self.comment_likes.count()
    