from .views import signup
from .views import signinView
from django.urls import path

from rest_framework_simplejwt.views import (
    TokenRefreshView,
    TokenVerifyView,
)

urlpatterns = [
    path('signin', signinView.as_view(), name='token_obtain_pair'),
    path('signup', signup),
    path('token/refresh', TokenRefreshView.as_view(), name='token_refresh'),
    path('token/verify', TokenVerifyView.as_view(), name='token_verify'),
]
