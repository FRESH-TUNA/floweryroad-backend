from rest_framework import viewsets, mixins
from rest_framework.response import Response
from rest_framework.filters import SearchFilter, OrderingFilter
import django_filters
from django_filters.rest_framework import DjangoFilterBackend
from core.models import Flower
from core.serializers import FlowerListSerializer, FlowerDetailSerializer
from core.paginators import FlowerPaginator

from django.db.models import Avg, Count


class FlowerFilter(django_filters.FilterSet):
    name = django_filters.CharFilter(lookup_expr='icontains')
    color = django_filters.NumberFilter(field_name='colors__id')
    purpose = django_filters.CharFilter(field_name='purposes__name')
    language = django_filters.CharFilter(field_name='languages__name')
    birth = django_filters.NumberFilter(
        field_name='births__date', lookup_expr='month')

    class Meta:
        model = Flower
        fields = ['name', 'color', 'purpose', 'language', 'season', 'birth']


class FlowerViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Flower.objects.all()
    serializer_class = FlowerListSerializer
    pagination_class = FlowerPaginator
    filter_backends = (SearchFilter, DjangoFilterBackend)

    # 전체 검색(icontains)
    search_fields = ['name', 'description',
                     'languages__name', 'purposes__name']

    # 특정 필드 검색
    filter_class = FlowerFilter

    # 정렬 기준
    # ordering_fields = ('star',)

    def get_queryset(self):
        ordering = self.request.GET.get('ordering', '')
        if ordering:
            # 별점 순 정렬
            if ordering.endswith('star'):
                queryset = Flower.objects.annotate(
                    star=Avg('comments__star')).order_by(ordering)
                return queryset
            elif ordering.endswith('view'):
                queryset = Flower.objects.annotate(
                    view=Count('views')).order_by(ordering)
                return queryset

    def get_serializer_class(self):
        if self.action == 'list':
            return FlowerListSerializer
        elif self.action == 'retrieve':
            return FlowerDetailSerializer
        else:
            return FlowerListSerializer
