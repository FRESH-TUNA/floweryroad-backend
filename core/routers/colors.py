from rest_framework.routers import DefaultRouter
from core.views import ColorViewSet

# base 이름은 view의 단축이름을 만들때 사용한다.
colors_router = DefaultRouter(trailing_slash=False)
colors_router.register(r'colors', ColorViewSet, basename='colors')
