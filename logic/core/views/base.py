from rest_framework.viewsets import GenericViewSet

from rest_framework.mixins import (
    ListModelMixin, 
    RetrieveModelMixin, 
    CreateModelMixin, 
    UpdateModelMixin, 
    DestroyModelMixin
)

class BaseGenericViewSet(
    GenericViewSet, 
    ListModelMixin, 
    RetrieveModelMixin, 
    CreateModelMixin, 
    UpdateModelMixin, 
    DestroyModelMixin
):
    # serializer_class = PurposeSerializer
    # lookup_field = 'comment_pk'
    pass
