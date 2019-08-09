from django.db import models
from django.conf import settings
from . import Flower

class Image(models.Model):
    url = models.ImageField()
    flower = models.ForeignKey(Flower, related_name="images", on_delete=models.SET_NULL, null=True, blank=True)

    @property
    def image_url(self):
        return self.url.url