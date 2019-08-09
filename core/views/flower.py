from rest_framework import viewsets, mixins
from rest_framework.response import Response
from core.models import Flower
from core.serializers import FlowerSerializer


class FlowerViewSet(mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    queryset = Flower.objects.all()
    serializer_class = FlowerSerializer
