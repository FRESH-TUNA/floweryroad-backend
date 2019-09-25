from django.db import models

class Purpose(models.Model):
    name = models.CharField(max_length=40)
    image = models.ImageField()

    def __str__(self):
        return self.name