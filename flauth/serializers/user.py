from rest_framework import serializers
from flauth.models import User
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