from rest_framework import status
from rest_framework.response import Response
from rest_framework.settings import api_settings

from core.models import Flower

class CreateModelMixin:
    def perform_create(self, serializer, flower):
        serializer.save(user=self.request.user, flower=flower)

    def create(self, request, *args, **kwargs):
        flower = Flower.objects.get(pk=kwargs['flower_pk'])
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer, flower)
        self.action = 'list'
        return self.list(request)
    