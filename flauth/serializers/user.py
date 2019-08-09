from rest_framework import serializers
from flauth.models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'nickname', 'email', 'color', 'purpose', 'date_joined']


class UserNicknameSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['nickname']