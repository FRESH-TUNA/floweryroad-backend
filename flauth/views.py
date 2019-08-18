from rest_framework import status, viewsets, mixins
from rest_framework.decorators import api_view, permission_classes, parser_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.parsers import JSONParser
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from django.contrib.auth import authenticate

from .models import User
from .serializers import UserSerializer, CustomTokenObtainPairSerializer
import logging
import json

class UserViewSet(mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class signinView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer

@api_view(['POST'])
@parser_classes([JSONParser])
def signup(request):
    if request.data['password1'] == request.data["password2"]:
        user = User.objects.create_user(
            email=request.data['email'],
            password=request.data['password1'],
        )
        serializer = CustomTokenObtainPairSerializer(
            data={'email': request.data['email'], 'password': request.data['password1']})
        if serializer.is_valid():
            return Response(serializer.validated_data, status=status.HTTP_201_CREATED)
    else:
        return Response({"error: repeat password is not correct"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['PUT'])
@parser_classes([JSONParser])
def change_nickname(request):
    authenticate_kwargs = {
        'email': request.data['email'],
        'password': request.data['password'],
    }
    if authenticate(**authenticate_kwargs) is not None:
        request.user.nickname = request.data['nickname']
        request.user.save()
        return Response({'nickname': request.user.nickname}, status=status.HTTP_206_PARTIAL_CONTENT)
    else:
        return Response({'password': 'password is not correct'}, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['PUT'])
@parser_classes([JSONParser])
def change_password(request):
    authenticate_kwargs = {
        'email': request.data['email'],
        'password': request.data['password'],
    }
    if authenticate(**authenticate_kwargs) is None:
        return Response({'password': 'password is not correct'}, status=status.HTTP_401_UNAUTHORIZED)
    if request.data['password1'] == request.data['password2']:
        request.user.set_password(request.data['password1'])
        request.user.save()
        return Response({'password': 'password changed successfully'}, status=status.HTTP_206_PARTIAL_CONTENT)
    else:
        return Response({'password': 'repeat password is not correct'}, status=status.HTTP_400_BAD_REQUEST)
        
