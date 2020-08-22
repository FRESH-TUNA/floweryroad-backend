from rest_framework import viewsets, mixins, status
from rest_framework.response import Response
from core.models import Comment, CommentLike, Flower
from core.serializers import *
from core.paginators import *
from core.views.base import BaseGenericViewSet
from core.permissions import (DeleteOnly, HasObjectPermission)

class CommentsViewSet(BaseGenericViewSet):
    permission_classes = [DeleteOnly, HasObjectPermission]
    serializer_class = CommentsSerializer
    paginator_class = CommentsPaginator
    
    def get_object(self):
        return Comment.objects.get(id=self.kwargs["pk"])
    
    def get_queryset(self):
        flower = Flower.objects.get(pk=self.request.data['flower_pk'])
        return Comment.objects.filter(flower=flower).order_by('-created_at')

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return self.list(request)
