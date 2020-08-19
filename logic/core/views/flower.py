from rest_framework.viewsets import GenericViewSet
from rest_framework.response import Response
from rest_framework.filters import SearchFilter, OrderingFilter
import django_filters
from django_filters.rest_framework import DjangoFilterBackend
from django.db.models import Avg, Count, Func

from core.models import Flower
from core.serializers import FlowerListSerializer, FlowerDetailSerializer
from core.mixins.flower import ListModelMixin, RetrieveModelMixin
from core.paginators import FlowerPaginator
from django.db.models import Prefetch

class Round(Func):
    function = "ROUND"
    template = "%(function)s(%(expressions)s::numeric, 1)"

class FlowerFilter(django_filters.FilterSet):
    name = django_filters.CharFilter(lookup_expr='icontains')
    color = django_filters.CharFilter(field_name='colors__name')
    purpose = django_filters.CharFilter(field_name='purposes__name')
    language = django_filters.CharFilter(field_name='languages__name')
    birth = django_filters.NumberFilter(
        field_name='births__date', lookup_expr='month')

    class Meta:
        model = Flower
        fields = ['name', 'color', 'purpose', 'language', 'season', 'birth']


class FlowerViewSet(ListModelMixin,
                    RetrieveModelMixin,
                    GenericViewSet):
    pagination_class = FlowerPaginator
    filter_backends = (SearchFilter, DjangoFilterBackend)

    # search query에 대한 전체 검색(icontains), query에 대해 모두 체크
    search_fields = ['name', 'description',
                    'languages__name', 'purposes__name', 'colors__name']

    # 특정 필드 query에 대한 검색
    filter_class = FlowerFilter

    # # 정렬 기준
    # ordering_fields = ('name',)
    # lookup_field = 'pk'
    
    def get_queryset(self):
        queryset = Flower.objects.annotate(
            star=Round(Avg('comments__star'))).prefetch_related(
                'languages', 'colors', 'purposes', 'images')
        ordering = self.request.GET.get('ordering', '')
        if ordering:
            if ordering.endswith('star'):
                queryset = queryset.order_by(ordering)
                return queryset
            elif ordering.endswith('view'):
                queryset = queryset.order_by(ordering)
                return queryset
        else:
            queryset = queryset.order_by('star')
        return queryset

    def get_serializer_class(self):
        if self.action == 'list':
            return FlowerListSerializer
        elif self.action == 'retrieve':
            return FlowerDetailSerializer
        else:
            return FlowerListSerializer
