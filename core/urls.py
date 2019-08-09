from django.contrib import admin
from django.urls import path
from rest_framework.routers import DefaultRouter
from rest_framework_nested.routers import NestedSimpleRouter
from .views import FlowerViewSet, PurposeViewSet, ColorViewSet
from .views import CommentFlowerViewSet

router = DefaultRouter()
router.register(r'flowers', FlowerViewSet, basename='flower')
router.register(r'purposes', PurposeViewSet, basename='purpose')
router.register(r'colors', ColorViewSet, basename='color')

flowers_router = NestedSimpleRouter(router, r'flowers', lookup='flower')
flowers_router.register(r'comments', CommentFlowerViewSet, base_name='flower-comments')
