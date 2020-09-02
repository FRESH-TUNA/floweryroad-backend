from rest_framework import viewsets
from core.models import CommentLike, Comment
from core.serializers import CommentSerializer
from core.paginators import CommentPaginator

class UsersCommentViewset(viewsets.ReadOnlyModelViewSet):
    serializer_class = CommentSerializer
    pagination_class = CommentPaginator

    def get_queryset(self):
        is_like = self.request.GET.get('like', None)
        user = User.objects.get(pk=self.kwargs['user_pk'])

        if (is_like == 'true'):
            return Comment.objects.filter(comment_likes__user=user, comment_likes__like=True)
        else:
            return Comment.objects.filter(user=user)
        