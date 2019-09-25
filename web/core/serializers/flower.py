from rest_framework import serializers
from core.models import Color, Language, Image, Flower
from core.serializers import PurposeSerializer
from django.db.models import Avg, F

from django.core.validators import MaxValueValidator, MinValueValidator
import logging

class ImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Image
        fields = ['url']


class ColorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Color
        fields = '__all__'


class LanguageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Language
        fields = '__all__'

class _FlowerSerializer(serializers.Serializer):    
    id = serializers.IntegerField()
    languages = LanguageSerializer(many=True, read_only=True)
    colors = ColorSerializer(many=True, read_only=True)
    purposes = PurposeSerializer(many=True, read_only=True)
    star = serializers.FloatField()

class FlowerListSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    name = serializers.CharField()
    purposes = PurposeSerializer(many=True, read_only=True)
    image = serializers.SerializerMethodField('get_thumbnail')
    star = serializers.FloatField()

    def get_thumbnail(self, obj):
        image = ImageSerializer(obj.images.all()[0], read_only=True)
        # image = ImageSerializer(obj.images.first(), read_only=True)   //정렬해서 튀어나온다.
        return image.data

class FlowerDetailSerializer(serializers.ModelSerializer):
    star = serializers.FloatField()
    purposes = PurposeSerializer(many=True)
    languages = LanguageSerializer(many=True)
    colors = ColorSerializer(many=True)
    images = ImageSerializer(many=True)
    class Meta:
        model = Flower
        fields = ['id', 'name', 'description', 'star', 'season',
                  'images', 'languages', 'colors', 'purposes']

class CommentFlowerSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    name = serializers.CharField()
    image = serializers.SerializerMethodField('get_thumbnail')

    def get_thumbnail(self, obj):
        image = ImageSerializer(obj.images.all()[0], read_only=True)
        return image.data

SEASON = (
    (0, '봄'),
    (1, '여름'),
    (2, '가을'),
    (3, '겨울'),
)

