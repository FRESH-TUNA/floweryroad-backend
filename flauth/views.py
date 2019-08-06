from rest_framework import status
from rest_framework.decorators import api_view, permission_classes, parser_classes
from rest_framework.permissions import IsAuthenticated
from .models import User
import logging
import json
from rest_framework.response import Response
from rest_framework.parsers import JSONParser

from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from .serializers import CustomTokenObtainPairSerializer


@api_view(['POST'])
@parser_classes([JSONParser])
def signup(request):
    if request.data['password1'] == request.data["password2"]:
        user = User.objects.create_user(
            email=request.data['email'],
            password=request.data['password1'],
        )    
        serializer = CustomTokenObtainPairSerializer(data={'email':request.data['email'], 'password': request.data['password1']})
        if serializer.is_valid():
            return Response(serializer.validated_data, status=status.HTTP_201_CREATED)
    else:
        return Response({"error: repeat password is not correct"}, status=status.HTTP_400_BAD_REQUEST)
    
            
class signinView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer