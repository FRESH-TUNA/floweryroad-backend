from django.db import models

class Color(models.Model):
    name = models.CharField(max_length=20)
    code = models.CharField(max_length=7)

    def __str__(self):
        return self.name