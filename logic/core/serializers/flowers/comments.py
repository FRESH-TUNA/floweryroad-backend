from rest_framework import serializers
from django.core.validators import MaxValueValidator, MinValueValidator

from core.models import Comment, CommentLike
from . import CommentFlowerSerializer
# from auth.serializers import UserNicknameSerializer
import logging

class CommentSerializer(serializers.ModelSerializer):
    is_like = serializers.SerializerMethodField('get_is_like')
    is_owner = serializers.SerializerMethodField('get_is_owner')
    # user = UserNicknameSerializer(read_only=True)
    flower = CommentFlowerSerializer(read_only=True)

    class Meta:
        model = Comment
        fields = ['id', 'content', 'star',
                  'created_at', 'like', 'is_like', 'user', 'flower', 'is_owner']

    def get_is_like(self, obj):
        if self.context['request'].user.is_authenticated:
            
            like_comment = CommentLike.objects.all().filter(
                comment=obj, user=self.context['request'].user).first()
            if like_comment:    
                return True
        return False
    
    def get_is_owner(self, obj):
        if obj.user == self.context['request'].user:
            return True
        else:
            return False


class CommentCreateSerializer(serializers.Serializer):
    content = serializers.CharField(max_length=200, allow_blank=True)
    star = serializers.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(5.0)], default=0.0)

    def create(self, validated_data):
        return Comment.objects.create(**validated_data)
    
    def update(self, instance, validated_data):
        instance.content = validated_data['content']
        setattr(instance, 'star', validated_data['star'])
        return instance
