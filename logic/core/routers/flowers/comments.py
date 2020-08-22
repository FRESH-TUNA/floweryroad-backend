from rest_framework_nested.routers import NestedSimpleRouter
from core.views import FlowersCommentsViewSet
from . import flowers_router

# lookup에 _pk가 붙여져진다
flowers_comments_router = NestedSimpleRouter(flowers_router, r'flowers', lookup='flower')
flowers_comments_router.register(r'comments', FlowersCommentsViewSet, basename='flowers_comments')
