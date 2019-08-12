from rest_framework import serializers
from core.models import Comment, CommentLike

from flauth.serializers.user import UserNicknameSerializer
from . import CommentFlowerSerializer
# is_like 접속한 유저가 해당 댓글에 좋아요 여부


class CommentSerializer(serializers.ModelSerializer):
    is_like = serializers.SerializerMethodField()
    user = UserNicknameSerializer(read_only=True)
    flower = CommentFlowerSerializer(read_only=True)

    class Meta:
        model = Comment
        fields = ['id', 'content', 'star',
                  'created_at', 'like', 'is_like', 'user', 'flower']

    def get_is_like(self, obj):
        if self.context['request'].user.is_authenticated:
            like_comment = CommentLike.objects.all().filter(
                comment=obj, user=self.context['request'].user).first()

            if like_comment:
                return True
        return False
