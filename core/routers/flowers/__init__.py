from rest_framework.routers import DefaultRouter, SimpleRouter
from core.views import FlowerViewSet

# base 이름은 view의 단축이름을 만들때 사용한다.
flowers_router = DefaultRouter(trailing_slash=False)
flowers_router.register(r'flowers', FlowerViewSet, basename='flowers')
