from rest_framework import viewsets, mixins
from rest_framework.response import Response
from rest_framework.filters import SearchFilter, OrderingFilter
import django_filters
from django_filters.rest_framework import DjangoFilterBackend
from core.models import Flower
from core.serializers import FlowerListSerializer, FlowerDetailSerializer
from core.paginators import FlowerPaginator


class FlowerFilter(django_filters.FilterSet):
    name = django_filters.CharFilter(method='icontains_filter')
    languages = django_filters.CharFilter(method='name_filter')
    purposes = django_filters.CharFilter(method='name_filter')

    class Meta:
        model = Flower
        fields = ['name', 'season', 'languages', 'colors', 'purposes']

    def icontains_filter(self, queryset, key, value):
        key += '__icontains'
        return queryset.filter(**{key: value, })

    def name_filter(self, queryset, key, value):
        key += '__name'
        return queryset.filter(**{key: value, })


class FlowerViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Flower.objects.all()
    serializer_class = FlowerListSerializer
    pagination_class = FlowerPaginator
    # filter_backends = (SearchFilter, DjangoFilterBackend, OrderingFilter)
    filter_backends = (SearchFilter, DjangoFilterBackend,)

    # 전체 검색(icontains)
    search_fields = ['name', 'description',
                     'languages__name', 'purposes__name']

    # 특정 필드 검색
    filter_class = FlowerFilter

    # 정렬 기준
    # ordering =('id',)

    def get_serializer_class(self):
        if self.action == 'list':
            return FlowerListSerializer
        elif self.action == 'retrieve':
            return FlowerDetailSerializer
        else:
            return FlowerListSerializer
