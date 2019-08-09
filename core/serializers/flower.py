from rest_framework import serializers
from core.models import Flower

class FlowerListSerializer():
    pass

class FlowerForCommentListSerializer():
    class Meta:
        model = Flower
        fields = ['id', 'name', 'image']