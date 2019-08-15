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


class _FlowerSerializer(serializers.ModelSerializer):
    languages = LanguageSerializer(many=True, read_only=True)
    colors = ColorSerializer(many=True, read_only=True)
    purposes = PurposeSerializer(many=True, read_only=True)
    star = serializers.FloatField(required=False)

    class Meta:
        model = Flower
        fields = ['id', 'name', 'purposes', 'image', 'star', ]

    # def get_star(self, obj):
    #     return obj.comments.aggregate(avgs=Avg(F('star'))).get('avgs', None)

class FlowerListSerializer(_FlowerSerializer):
    image = serializers.SerializerMethodField('get_thumbnail')

    class Meta:
        model = Flower
        fields = ['id', 'name', 'purposes', 'image', 'star', ]

    def get_thumbnail(self, obj):
        image = ImageSerializer(obj.images.first())
        return image.data


class FlowerDetailSerializer(_FlowerSerializer):
    images = ImageSerializer(many=True, read_only=True)

    class Meta:
        model = Flower
        fields = ['id', 'name', 'description', 'star', 'season',
                  'images', 'languages', 'colors', 'purposes']


class CommentFlowerSerializer(FlowerListSerializer):
    class Meta:
        model = Flower
        fields = ['id', 'name', 'image']

SEASON = (
        (0, '봄'),
        (1, '여름'),
        (2, '가을'),
        (3, '겨울'),
    )

# class CustomFlowerSerializer(serializers.Serializer):
#     name = serializers.CharField(read_only=True, required=False)
#     description = serializers.CharField(required=False)
#     season = serializers.IntegerField(default=1, choices=SEASON)
#     # languages = models.ManyToManyField(Language, related_name='flowers')
#     # colors = models.ManyToManyField(Color, related_name='flowers')
#     # purposes = models.ManyToManyField(Purpose, related_name='flowers')
#     def save(self):
#         email = self.validated_data['email']
#         message = self.validated_data['message']
#         send_email(from=email, message=message)


#     def create(self, validated_data):
#         return Flower.objects.create(**validated_data)

#     def update(self, instance, validated_data):
#         instance.name = validated_data.get('name', instance.name)
#         instance.description = validated_data.get('description', instance.description)
#         instance.season = validated_data.get('season', instance.season)
#         instance.save()
#         return instance
