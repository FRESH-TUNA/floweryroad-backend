from rest_framework import viewsets, mixins
from rest_framework.response import Response
from core.models import Color
from core.serializers import ColorSerializer

class ColorViewSet(mixins.ListModelMixin, viewsets.GenericViewSet):
    queryset = Color.objects.all()
    serializer_class = ColorSerializer
