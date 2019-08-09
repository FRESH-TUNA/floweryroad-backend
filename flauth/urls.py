from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt.views import (TokenRefreshView, TokenVerifyView,)
from django.urls import path, include
from .views import signup, signinView, UserViewSet

router = DefaultRouter()
router.register(r'users', UserViewSet, basename='user')

urlpatterns = [
    path('signin', signinView.as_view(), name='token_obtain_pair'),
    path('signup', signup),
    path('token/refresh', TokenRefreshView.as_view(), name='token_refresh'),
    path('token/verify', TokenVerifyView.as_view(), name='token_verify'),
]
