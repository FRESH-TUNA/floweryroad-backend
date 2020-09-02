from rest_framework import status
from rest_framework.response import Response
from rest_framework.settings import api_settings

from core.models import Flower

class CreateModelMixin:
    def create(self, request, *args, **kwargs):
        flower = Flower.objects.get(pk=kwargs['flower_pk'])
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer, flower)
        self.action = 'list'
        return self.list(request)
    
    def perform_create(self, serializer, flower):
        # model serializer의 경우 create, update시 추가적으로 반영할 녀석들을 넘겨줄수 있다.
        serializer.save(user=self.request.user, flower=flower)