from rest_framework import serializers
from core.models import Comment

class CommentListSerializer(serializers.ModelSerializer):
    username = UsernameSerializer(read_only=True)
    is_like = serializers.PrimaryKeyRelatedField()
    flower = FlowerForCommentListSerializer(read_only=True)

    class Meta:
        model = Comment
        fields = ['id', 'content', 'star', 'created_at', 'like']