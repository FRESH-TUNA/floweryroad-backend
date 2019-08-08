from rest_framework import viewsets
from rest_framework.response import Response
from core.models import Purpose
from core.serializers import PurposeSerializer

class PurposeViewSet(viewsets.ViewSet):
    queryset = Purpose.objects.all()
    serializer_class = PurposeSerializer

    def list(self, request):
        queryset = Purpose.objects.all()
        serializer = PurposeSerializer(queryset, many=True)
        return Response(serializer.data)