from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from core.models import CommentLike, Comment
from core.views import BaseViewSet
from core.permissions import PostDeleteOnly
# from core.mixins.comments.likes import (CreateModelMixin, DestroyModelMixin)
from core.serializers import PurposeSerializer

class CommentsLikesViewSet(
    BaseViewSet,
    # CreateModelMixin,
    # DestroyModelMixin
):
    permission_classes = [PostDeleteOnly]
    serializer_class = PurposeSerializer

    def get_or_create_object(self):
        like_obj, isNew = \
            CommentLike.objects.get_or_create(
                user=self.request.user, comment=Comment.objects.get(id=self.kwargs["comment_pk"]))
        if like_obj is None:
            return isNew
        else:
            return like_obj

    def create(self, request, *args, **kwargs):
        instance = self.get_or_create_object()
        self.perform_create(instance)
        return Response(
            {
                "is_like": True,
                "count": CommentLike.objects.all().filter(
                    comment=Comment.objects.get(id=self.kwargs["comment_pk"]),
                    like=True
                ).count()
            }, status=status.HTTP_201_CREATED
        )
    
    def perform_create(self, instance):
        instance.like = True
        instance.save()

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response(
            {
                "is_like": False,
                "count": CommentLike.objects.all().filter(
                    comment=Comment.objects.get(id=pk),
                    like=True
                ).count()
            }, status=status.HTTP_204_NO_CONTENT
        )

    def perform_destroy(self, instance):
        instance.like = False
        instance.save() 