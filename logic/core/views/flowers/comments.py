from core.views.base import BaseGenericViewSet
from core.permissions import ReadOnly
from core.serializers import CommentSerializer
from core.paginators import CommentPaginator
from core.models import Comment, Flower

class FlowersCommentsViewSet(BaseGenericViewSet):
    serializer_class = CommentSerializer
    pagination_class = CommentPaginator
    permission_classes = [ReadOnly]

    def get_queryset(self):
        flower = Flower.objects.get(pk=self.kwargs['flower_pk'])
        return Comment.objects.filter(flower=flower).order_by('-created_at')
