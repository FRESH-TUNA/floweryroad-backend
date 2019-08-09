from django.contrib import admin
from django.urls import path
from rest_framework.routers import DefaultRouter
from .views import FlowerViewSet, PurposeViewSet, ColorViewSet

router = DefaultRouter()
router.register(r'flowers', FlowerViewSet, basename='flower')
router.register(r'purposes', PurposeViewSet, basename='purpose')
router.register(r'colors', ColorViewSet, basename='color')
