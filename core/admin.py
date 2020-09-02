from django.contrib import admin
from .models import (Purpose, Color, Flower, Language, Image, Comment, CommentLike, Birth, View)
# Register your models here.
admin.site.register(Purpose)
admin.site.register(Color)
admin.site.register(Flower)
admin.site.register(Language)
admin.site.register(Image)
admin.site.register(Comment)
admin.site.register(CommentLike)
admin.site.register(Birth)
admin.site.register(View)
