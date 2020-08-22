from rest_framework import serializers
from django.core.validators import MaxValueValidator, MinValueValidator

from core.models import Comment, CommentLike
from . import CommentFlowerSerializer
# from auth.serializers import UserNicknameSerializer
import logging

class CommentsSerializer(serializers.ModelSerializer):
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
