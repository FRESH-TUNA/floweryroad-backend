from django.urls import path, include
from rest_framework.routers import DefaultRouter, SimpleRouter
from rest_framework_nested.routers import NestedSimpleRouter
from .views import FlowerViewSet, PurposeViewSet, ColorViewSet
from .views import CommentFlowerViewSet, CommentsViewSet, CommentsLikesViewSet
from .views.flowers.comments import FlowersCommentsViewSet
from .routers.comments.likes import CommentsLikesRouter

root_router = DefaultRouter(trailing_slash=False)
root_router.register(r'flowers', FlowerViewSet, basename='flower')
root_router.register(r'purposes', PurposeViewSet, basename='purpose')
root_router.register(r'colors', ColorViewSet, basename='color')

comments_router = SimpleRouter(trailing_slash=False)
comments_router.register(r'comments', CommentsViewSet, basename='comments')

comments_likes_router = CommentsLikesRouter(trailing_slash=False)
comments_likes_router.register(r'comments', CommentsLikesViewSet, basename='comments_likes')

flowers_comments_router = NestedSimpleRouter(root_router, r'flowers', lookup='flower')
flowers_comments_router.register(r'comments', FlowersCommentsViewSet, base_name='flower_comments')

urlpatterns = [
    path('', include(root_router.urls)),
    path('', include(comments_router.urls)),
    path('', include(flowers_comments_router.urls)),
    path('', include(comments_router.urls))
]
