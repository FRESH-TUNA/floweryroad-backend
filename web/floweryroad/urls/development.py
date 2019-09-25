from .base import urlpatterns
import floweryroad.settings.development as settings
from django.conf.urls.static import static
import debug_toolbar
from django.urls import include, re_path

urlpatterns += [
    re_path(r'^__debug__/', include(debug_toolbar.urls)),
]

urlpatterns += static(
    '/media/',
    document_root=settings.MEDIA_ROOT
)