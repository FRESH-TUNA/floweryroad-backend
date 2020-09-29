from rest_framework import serializers
from django.core.validators import MaxValueValidator, MinValueValidator

from core.models import Comment, CommentLike
from . import CommentFlowerSerializer
from auth.serializers.users import UserNicknameSerializer
import logging

# Read-only fields are included in the API output, but should not be included in the input during create or update operations.
# create, update는 model의 필드들에 대해서만 검사한다.
# read를 위한 serialize에 Meta클래스와 사용자정의필드를 검사한다.
class FlowersCommentsSerializer(serializers.ModelSerializer):
    is_like = serializers.SerializerMethodField('get_is_like')
    is_owner = serializers.SerializerMethodField('get_is_owner')
    # read_only 옵션을 통해 read에만 적용되도록한다.
    user = UserNicknameSerializer(read_only=True)
    flower = CommentFlowerSerializer(read_only=True)
    content = serializers.CharField(max_length=200, allow_blank=True)
    star = serializers.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(5.0)], default=0.0)
    
    class Meta:
        model = Comment
        fields = ['id', 'content', 'star',
                  'created_at', 'like', 'user', 'flower', 'is_owner', 'is_like']

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
