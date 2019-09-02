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


# class _FlowerSerializer(serializers.ModelSerializer):
#     languages = LanguageSerializer(many=True, read_only=True)
#     colors = ColorSerializer(many=True, read_only=True)
#     purposes = PurposeSerializer(many=True, read_only=True)
#     star = serializers.FloatField()

#     class Meta:
#         model = Flower
#         fields = ['id', 'name', 'purposes', 'image', 'star', ]

class _FlowerSerializer(serializers.Serializer):    
    id = serializers.IntegerField()
    languages = LanguageSerializer(many=True, read_only=True)
    colors = ColorSerializer(many=True, read_only=True)
    purposes = PurposeSerializer(many=True, read_only=True)
    star = serializers.FloatField()

# class FlowerListSerializer(_FlowerSerializer):
#     image = serializers.SerializerMethodField('get_thumbnail')

#     class Meta:
#         model = Flower
#         fields = ['id', 'name', 'purposes', 'image', 'star', ]

#     def get_thumbnail(self, obj):
#         image = ImageSerializer(obj.images.first(), read_only=True)
#         return image.data

class FlowerListSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    name = serializers.CharField()
    purposes = PurposeSerializer(many=True, read_only=True)
    image = serializers.SerializerMethodField('get_thumbnail')
    star = serializers.FloatField()

    def get_thumbnail(self, obj):
        image = ImageSerializer(obj.images.first(), read_only=True)
        return image.data


class FlowerDetailSerializer(serializers.ModelSerializer):
    # images = ImageSerializer(many=True, read_only=True)
    star = serializers.FloatField()
    purposes = PurposeSerializer(many=True)
    languages = LanguageSerializer(many=True)
    colors = ColorSerializer(many=True)
    images = ImageSerializer(many=True)
    class Meta:
        model = Flower
        fields = ['id', 'name', 'description', 'star', 'season',
                  'images', 'languages', 'colors', 'purposes']
    

# class FlowerDetailSerializer(serializers.Serializer):
#     id = serializers.IntegerField()
#     name = serializers.CharField()
#     description = serializers.CharField()
#     season = serializers.IntegerField()
#     star = serializers.FloatField()
#     purposes = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
#     languages = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
#     colors = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
#     images = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

   



class CommentFlowerSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    name = serializers.CharField()
    image = serializers.SerializerMethodField('get_thumbnail')

    def get_thumbnail(self, obj):
        image = ImageSerializer(obj.images.first(), read_only=True)
        return image.data

SEASON = (
    (0, '봄'),
    (1, '여름'),
    (2, '가을'),
    (3, '겨울'),
)


# class CustomFlowerSerializer(serializers.Serializer):
#     id = serializers.IntegerField()
#     name = serializers.CharField()
#     description = serializers.CharField()
#     season = serializers.IntegerField()
#     star = serializers.FloatField()
#     purposes = PurposeSerializer(many=True)
#     languages = LanguageSerializer(many=True)
#     colors = ColorSerializer(many=True)
#     images = ImageSerializer(many=True)

#     # def save(self):
#     #     email = self.validated_data['email']
#     #     message = self.validated_data['message']
#     #     send_email(from=email, message=message)

#     def create(self, validated_data):
#         return Flower.objects.create(**validated_data)

#     def update(self, instance, validated_data):
#         instance.name = validated_data.get('name', instance.name)
#         instance.description = validated_data.get('description', instance.description)
#         instance.season = validated_data.get('season', instance.season)
#         instance.save()
#         return instance
