from rest_framework import viewsets, mixins, status
from rest_framework.response import Response
from core.models import Comment, CommentLike, Flower
from auth.models import User
from core.serializers import CommentSerializer, CommentCreateSerializer
from core.mixins.comment import CreateModelMixin
from core.paginators import CommentPaginator
from rest_framework_simplejwt.authentication import JWTAuthentication
from core.views.base import BaseGenericViewSet
from core.permissions import (DeleteOnly, HasObjectPermission)

class CommentFlowerViewSet(mixins.ListModelMixin,
                           CreateModelMixin,
                           viewsets.GenericViewSet
                          ):
    pagination_class = CommentPaginator

    def get_queryset(self):
        # flower = Flower.objects.select_related('user').get(pk=self.kwargs['flower_pk'])
        return Comment.objects.select_related('user', 'flower').prefetch_related('comment_likes', 'flower__images').filter(flower_id=self.kwargs['flower_pk']).order_by('-created_at')

    def get_serializer_class(self):
        if self.action == 'list':
            return CommentSerializer
        else:
            return CommentCreateSerializer

class CommentsViewSet(BaseGenericViewSet):
    permission_classes = [DeleteOnly, HasObjectPermission]
    serializer_class = CommentSerializer
    pagination_class = CommentPaginator

    def get_object(self):
        return Comment.objects.get(id=self.kwargs["pk"])
    
    def get_queryset(self):
        flower = Flower.objects.get(pk=self.request.data['flower_pk'])
        return Comment.objects.filter(flower=flower).order_by('-created_at')

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return self.list(request)
