from rest_framework import viewsets, mixins, status
from rest_framework.response import Response
from core.models import Comment, CommentLike, Flower
from auth.models import User
from core.serializers import CommentSerializer, CommentCreateSerializer
from core.mixins.comment import CreateModelMixin
from core.paginators import CommentPaginator
from rest_framework_simplejwt.authentication import JWTAuthentication
import logging 

class _CommentViewSet(viewsets.GenericViewSet):
    serializer_class = CommentSerializer
    pagination_class = CommentPaginator
    

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

class CommentDeleteViewSet(mixins.DestroyModelMixin, 
                           mixins.ListModelMixin,
                           _CommentViewSet
                          ):

    def get_queryset(self):
        flower = Flower.objects.get(pk=self.request.data['flower_pk'])
        return Comment.objects.filter(flower=flower).order_by('-created_at')

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return self.list(request)

# user가 작성한 댓글
class CommentUserViewSet(_CommentViewSet, viewsets.ReadOnlyModelViewSet):
    def get_queryset(self):
        user = User.objects.get(pk=self.kwargs['user_pk'])
        return Comment.objects.filter(user=user)

# user가 좋아요한 댓글
class CommentLikeViewSet(_CommentViewSet, viewsets.ReadOnlyModelViewSet):
    def get_queryset(self):
        user = User.objects.get(pk=self.kwargs['user_pk'])
        return Comment.objects.filter(comment_likes__user=user, comment_likes__like=True)
