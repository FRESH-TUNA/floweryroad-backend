from django.urls import path, include
from core.routers import *

urlpatterns = [
    path('', include(flowers_router.urls)),
    path('', include(purposes_router.urls)),
    path('', include(colors_router.urls)),
    path('', include(comments_router.urls)),
    path('', include(comments_likes_router.urls)),
    path('', include(flowers_comments_router.urls))
]
