from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter

from core.urls import router as core_router
from flauth.urls import router as flauth_router

#test commentlist 
from core.views.comment import FlowerCommentList, UserCommentList

router = DefaultRouter()
router.registry.extend(core_router.registry)
router.registry.extend(flauth_router.registry)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('flauth.urls')),
    path('', include(router.urls)),

    #commentlist url config 
    path('users/<int:id>/comments', UserCommentList.as_view()),
    path('flowers/<int:id>/comments', FlowerCommentList.as_view())
]
