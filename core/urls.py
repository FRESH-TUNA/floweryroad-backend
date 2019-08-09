from django.contrib import admin
from django.urls import path
from rest_framework.routers import DefaultRouter
# from rest_framework.urlpatterns import format_suffix_patterns
from .views import FlowerList, FlowerDetail, PurposeViewSet, ColorViewSet

router = DefaultRouter()
router.register(r'purposes', PurposeViewSet, basename='purpose')
router.register(r'colors', ColorViewSet, basename='color')
