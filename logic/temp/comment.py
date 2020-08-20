# class CommentFlowerViewSet(mixins.ListModelMixin,
#                            CreateModelMixin,
#                            viewsets.GenericViewSet
#                           ):
#     pagination_class = CommentPaginator

#     def get_queryset(self):
#         # flower = Flower.objects.select_related('user').get(pk=self.kwargs['flower_pk'])
#         return Comment.objects.select_related('user', 'flower').prefetch_related('comment_likes', 'flower__images').filter(flower_id=self.kwargs['flower_pk']).order_by('-created_at')

#     def get_serializer_class(self):
#         if self.action == 'list':
#             return CommentSerializer
#         else:
#             return CommentCreateSerializer
