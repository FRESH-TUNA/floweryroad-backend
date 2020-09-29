from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework_nested.routers import NestedSimpleRouter
from rest_framework_simplejwt.views import (TokenRefreshView, TokenVerifyView)
from .routers import *
from auth.views import SigninViewSet

urlpatterns = [
    path('', include(auth_router.urls)),
    path('signin', SigninViewSet.as_view(), name='token_obtain_pair'),
    path('token/refresh', TokenRefreshView.as_view(), name='token_refresh'),
    path('token/verify', TokenVerifyView.as_view(), name='token_verify'),
]
