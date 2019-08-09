from rest_framework import serializers
from core.models import Image
from django.core.files.storage import get_storage_class

class ImageSerializer(serializers.ModelSerializer):
    # url = serializers.SerializerMethodField('get_full_url')
    # current_storage = get_storage_class()()
    class Meta:
        model = Image
        fields = ['url']

    # def get_full_url(self, obj):
    #     return self.current_storage.url(str(obj.url))

    
    