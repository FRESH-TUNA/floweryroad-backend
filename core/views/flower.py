from rest_framework import viewsets, mixins
from rest_framework.response import Response
from core.models import Flower
from core.serializers import FlowerListSerializer, FlowerDetailSerializer


class FlowerViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Flower.objects.all()
    serializer_class = FlowerListSerializer

    def get_serializer_class(self):
        if self.action == 'list':
            return FlowerListSerializer
        elif self.action == 'retrieve':
            return FlowerDetailSerializer
        else:
            return FlowerListSerializer
