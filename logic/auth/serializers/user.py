from rest_framework import serializers
from auth.models import User
from core.serializers import ColorSerializer, PurposeSerializer

class UserSerializer(serializers.ModelSerializer):
    color = ColorSerializer()
    purpose = PurposeSerializer()

    class Meta:
        model = User
        fields = ['id', 'nickname', 'email', 'color', 'purpose', 'date_joined']


class UserNicknameSerializer(UserSerializer):
    class Meta:
        model = User
        fields = ['id', 'nickname']

class ChangeUserNicknameSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['email', 'password', 'nickname']
    
    def update(self, instance, validated_data):
        validated_data.pop('password')
        return super().update(instance, validated_data)
