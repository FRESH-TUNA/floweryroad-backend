from django.urls import path, include
from rest_framework.routers import DefaultRouter
from core.views import PurposeViewSet

# base 이름은 view의 단축이름을 만들때 사용한다.
purposes_router = DefaultRouter(trailing_slash=False)
purposes_router.register(r'purposes', PurposeViewSet, basename='purposes')
