from django.db import models

class Language(models.Model):
    name = models.CharField(max_length=40, unique=True)

    def __str__(self):
        return self.name