from core.views.base import BaseGenericViewSet
from core.permissions import CreateReadOnly
from core.serializers import *
from core.paginators import *
from core.models import Comment, Flower
from core.mixins.comment import CreateModelMixin

class FlowersCommentsViewSet(CreateModelMixin, BaseGenericViewSet):
    pagination_class = FlowersCommentsPaginator
    permission_classes = [CreateReadOnly]

    def get_queryset(self):
        # flower = Flower.objects.select_related('user').get(pk=self.kwargs['flower_pk'])
        flower = Flower.objects.get(pk=self.kwargs['flower_pk'])
        return Comment.objects.select_related('user', 'flower').prefetch_related('comment_likes', 'flower__images').filter(flower_id=self.kwargs['flower_pk']).order_by('-created_at')
    
    def get_serializer_class(self):
        if self.action == 'list':
            return FlowersCommentsSerializer
        else:
            return FlowersCommentsCreateSerializer
