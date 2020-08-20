from rest_framework import viewsets, mixins
from rest_framework.response import Response
from core.models import Purpose
from core.serializers import PurposeSerializer

class PurposeViewSet(mixins.ListModelMixin, viewsets.GenericViewSet):
    queryset = Purpose.objects.all()
    serializer_class = PurposeSerializer
