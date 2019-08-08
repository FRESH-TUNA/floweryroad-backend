from rest_framework import serializers
from core.models import Color

class ColorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Color
        fields = ['pk', 'name', 'color']