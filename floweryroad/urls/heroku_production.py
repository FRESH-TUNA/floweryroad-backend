from .base import urlpatterns
import floweryroad.settings.heroku_production as settings
from django.conf.urls.static import static

urlpatterns += static(
    '/media/',
    document_root=settings.MEDIA_ROOT
)
