from rest_framework import serializers
from core.models import Purpose

class PurposeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Purpose
        fields = ['pk', 'name', 'image']