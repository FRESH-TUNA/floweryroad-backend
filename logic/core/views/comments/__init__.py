from rest_framework.viewsets import ViewSet
from rest_framework.mixins import DestroyModelMixin
from core.models import Comment, CommentLike, Flower
from core.serializers import *
from core.permissions import (DeleteOnly, HasObjectPermission)

class CommentsViewSet(DestroyModelMixin, ViewSet):
    permission_classes = [DeleteOnly, HasObjectPermission]
    serializer_class = CommentsSerializer

    def get_object(self):
        obj = Comment.objects.get(id=self.kwargs["pk"])
        self.check_object_permissions(self.request, obj)
        return obj
