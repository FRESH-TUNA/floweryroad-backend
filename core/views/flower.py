from rest_framework import viewsets, mixins, filters
from rest_framework.response import Response
from core.models import Flower
from core.serializers import FlowerListSerializer, FlowerDetailSerializer


class FlowerFilterBackend(filters.BaseFilterBackend):
    allowed_fields = ['query']
    



class FlowerViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Flower.objects.all()
    serializer_class = FlowerListSerializer
    filter_backends = [filters.SearchFilter]

    # 전체 검색
    search_fields = ['name', 'description', 'languages__name', 'purposes__name']

    def get_serializer_class(self):
        if self.action == 'list':
            return FlowerListSerializer
        elif self.action == 'retrieve':
            return FlowerDetailSerializer
        else:
            return FlowerListSerializer
