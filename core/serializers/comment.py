from rest_framework import serializers
from core.models import Comment, CommentLike

from flauth.serializers.user import UserNicknameSerializer
from . import CommentFlowerSerializer
# is_like 접속한 유저가 해당 댓글에 좋아요 여부


class CommentSerializer(serializers.ModelSerializer):
    user = UserNicknameSerializer(read_only=True)
    is_like = serializers.SerializerMethodField(
        'get_is_like')  # custom 필드는 이렇게
    flower = CommentFlowerSerializer(read_only=True)

    class Meta:
        model = Comment
        fields = ['id', 'content', 'star',
                  'created_at', 'like', 'is_like', 'user', 'flower']

    def get_is_like(self, obj):
        like_comment = CommentLike.objects.all().filter(
            comment=obj, user=self.context['request'].user).first()

        if like_comment:
            return like_comment.like
        return False
