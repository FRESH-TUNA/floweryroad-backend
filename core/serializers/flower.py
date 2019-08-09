from rest_framework import serializers
from core.models import Color, Language, Flower
from core.serializers import PurposeSerializer


class ColorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Color
        fields = '__all__'


class LanguageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Language
        fields = '__all__'


class FlowerSerializer(serializers.ModelSerializer):
    languages = LanguageSerializer(many=True, read_only=True)
    colors = ColorSerializer(many=True, read_only=True)
    purposes = PurposeSerializer(many=True, read_only=True)

    class Meta:
        model = Flower
        fields = ['id', 'name', 'description',
                  'season', 'languages', 'colors', 'purposes']
