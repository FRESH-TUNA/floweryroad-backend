from rest_framework import serializers
from core.models import Flower
from core.serializers.image import ImageSerializer
import logging
import floweryroad.settings.development as settings

class FlowerListSerializer():
    pass

class FlowerForCommentListSerializer(serializers.ModelSerializer):
    image = serializers.SerializerMethodField('get_one_image')

    class Meta:
        model = Flower
        fields = ['id', 'name', 'image']

    def get_one_image(self, obj):
        image = ImageSerializer(obj.images.first(), context={'request': self.context['request']})
        return image.data
        