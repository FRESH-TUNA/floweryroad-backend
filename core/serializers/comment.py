from rest_framework import serializers
from core.models import Comment, CommentLike

from flauth.serializers.user import UserNicknameSerializer
from core.serializers.flower import FlowerForCommentListSerializer

import logging
#is_like 접속한 유저가 해당 댓글에 좋아요 여부

class CommentListSerializer(serializers.ModelSerializer):
    user = UserNicknameSerializer(read_only=True)
    is_like = serializers.SerializerMethodField('get_is_like') #custom 필드는 이렇게
    flower = FlowerForCommentListSerializer(read_only=True)

    class Meta:
        model = Comment
        fields = ['id', 'user', 'content', 'star', 'created_at', 'like', 'is_like', 'flower']

    def get_is_like(self, obj):
        comment_likes = CommentLike.objects.all().filter(comment=obj)
        user_comment_like = comment_likes.filter(user=self.context['request'].user)

        if user_comment_like.count() is 0:
            return False
        elif user_comment_like[0].like is True:
            return True
        else:
            return False
