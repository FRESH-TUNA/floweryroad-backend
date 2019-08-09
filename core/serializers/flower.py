# from django.http import request
from rest_framework import serializers
from core.models import Color, Language, Image, Flower
from core.serializers import PurposeSerializer


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


class FlowerSerializer(serializers.ModelSerializer):
    images = ImageSerializer(many=True, read_only=True)
    languages = LanguageSerializer(many=True, read_only=True)
    colors = ColorSerializer(many=True, read_only=True)
    purposes = PurposeSerializer(many=True, read_only=True)

    class Meta:
        model = Flower
        fields = ['id', 'name', 'description', 'images',
                  'season', 'languages', 'colors', 'purposes']
