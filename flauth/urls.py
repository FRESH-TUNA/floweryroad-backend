from rest_framework.routers import DefaultRouter
from rest_framework_nested.routers import NestedSimpleRouter
from rest_framework_simplejwt.views import (TokenRefreshView, TokenVerifyView,)
from django.urls import path, include
from .views import signup, change_nickname, change_password, signinView, UserViewSet
from core.views import CommentUserViewSet, CommentLikeViewSet

router = DefaultRouter()
router.register(r'users', UserViewSet, basename='user')

users_router = NestedSimpleRouter(router, r'users', lookup='user')
users_router.register(r'comments', CommentUserViewSet, base_name='user-comments')
users_router.register(r'likes', CommentLikeViewSet, base_name='user-likes')

urlpatterns = [
    path('signin', signinView.as_view(), name='token_obtain_pair'),
    path('signup', signup),
    path('nickname', change_nickname),
    path('password', change_password),
    path('token/refresh', TokenRefreshView.as_view(), name='token_refresh'),
    path('token/verify', TokenVerifyView.as_view(), name='token_verify'),
]
