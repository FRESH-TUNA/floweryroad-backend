from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from core.models import CommentLike, Comment

class LikeView(APIView):
    def post(self, request, pk):
        like_obj, isNew = \
            CommentLike.objects.get_or_create(
                user=request.user, comment=Comment.objects.get(id=pk))
        like_obj.like = True
        like_obj.save()
        return Response(
            {
                "is_like": True,
                "count": CommentLike.objects.all().filter(
                    comment=Comment.objects.get(id=pk),
                    like=True
                ).count()
            }, status=status.HTTP_201_CREATED
        )

    def delete(self, request, pk):
        like = CommentLike.objects.get(user=request.user, comment=Comment.objects.get(id=pk))
        like.like = False
        like.save()

        return Response(
            {
                "is_like": False,
                "count": CommentLike.objects.all().filter(
                    comment=Comment.objects.get(id=pk),
                    like=True
                ).count()
            }, status=status.HTTP_200_OK
        )
