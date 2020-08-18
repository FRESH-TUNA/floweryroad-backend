from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework_nested.routers import NestedSimpleRouter
from .views import FlowerViewSet, PurposeViewSet, ColorViewSet
from .views import CommentFlowerViewSet, CommentDeleteViewSet, LikeView, CommentsLikesViewSet
from .routers.comments.likes import CommentsLikesRouter

root_router = DefaultRouter(trailing_slash=False)
root_router.register(r'flowers', FlowerViewSet, basename='flower')
root_router.register(r'purposes', PurposeViewSet, basename='purpose')
root_router.register(r'colors', ColorViewSet, basename='color')

comments_likes_router = CommentsLikesRouter(trailing_slash=False)
comments_likes_router.register(r'comments', CommentsLikesViewSet, basename='comments_likes')

comments_router = NestedSimpleRouter(root_router, r'flowers', lookup='flower')
comments_router.register(r'comments', CommentFlowerViewSet, base_name='flower_comments')

urlpatterns = [
    path('', include(root_router.urls)),
    path('', include(comments_router.urls)),
    path('', include(comments_likes_router.urls)),
    path('comments/<int:pk>', CommentDeleteViewSet.as_view({'delete': 'destroy'}))
]
