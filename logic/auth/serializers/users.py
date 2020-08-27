from rest_framework import serializers
from auth.models import User
from django.db import models
from core.serializers import ColorSerializer, PurposeSerializer

class UserSerializer(serializers.ModelSerializer):
    color = ColorSerializer()
    purpose = PurposeSerializer()

    class Meta:
        model = User
        fields = ['id', 'nickname', 'email', 'color', 'purpose', 'date_joined']


class UserNicknameSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'nickname']
        read_only_fields = ['id', 'nickname']

class ChangeUserPasswordSerializer(serializers.Serializer):
    password1 = serializers.CharField(max_length=128)
    password2 = serializers.CharField(max_length=128)
    password = serializers.CharField(max_length=128)
    email = serializers.EmailField(
        max_length=255                                #username으로 쓰고싶은것에 반드시 unique 지정
    )
    
    def update(self, instance, validated_data):
        instance.set_password(validated_data['password1'])
        instance.save()
        return instance

    # def run_validation(self, data=None):
    #    pass
       
    def validate(self, data):
        if data['password1'] != data['password2']:
            raise serializers.ValidationError("passwords isn't correct")
        return data

class ChangeUserNicknameSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['email', 'password', 'nickname']
    
    def update(self, instance, validated_data):
        validated_data.pop('password')
        return super().update(instance, validated_data)

class SignupUserSerializer(serializers.Serializer):
    password1 = serializers.CharField(max_length=128)
    password2 = serializers.CharField(max_length=128)
    email = serializers.EmailField(
        max_length=255,
    )

    def validate(self, data):
        if data['password1'] != data['password2']:
            raise serializers.ValidationError("repeat password isn't correct")
        return data

    def create(self, validated_data):
        user = User.objects.create_user(
            email=validated_data['email'],
            password=validated_data['password1']
        )
        return user
