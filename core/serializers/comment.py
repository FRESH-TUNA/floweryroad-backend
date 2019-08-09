from rest_framework import serializers
from core.models import Comme

class PurposeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Purpose
        fields = ['id', 'name', 'image']