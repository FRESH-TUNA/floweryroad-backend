from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework_nested.routers import NestedSimpleRouter
from .views import FlowerViewSet, PurposeViewSet, ColorViewSet
from .views import CommentFlowerViewSet, CommentDeleteViewSet, LikeView

router = DefaultRouter(trailing_slash=False)
router.register(r'flowers', FlowerViewSet, basename='flower')
router.register(r'purposes', PurposeViewSet, basename='purpose')
router.register(r'colors', ColorViewSet, basename='color')

comments_router = NestedSimpleRouter(router, r'flowers', lookup='flower')
comments_router.register(r'comments', CommentFlowerViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('', include(comments_router.urls)),
    path('comments/<int:pk>/likes', LikeView.as_view()),
    path('comments/<int:pk>', CommentDeleteViewSet.as_view({'delete': 'destroy'}))
]