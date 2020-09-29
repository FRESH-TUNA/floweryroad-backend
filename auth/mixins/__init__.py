from rest_framework import status, viewsets, mixins
from rest_framework.decorators import api_view, permission_classes, parser_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.parsers import JSONParser
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from django.contrib.auth import authenticate

from auth.models import User
from auth.serializers import CustomTokenObtainPairSerializer
from auth.serializers.users import (
    ChangeUserNicknameSerializer, 
    ChangeUserPasswordSerializer,
    SignupUserSerializer
)

class SignupMixin:
    def signup_service(self, request, *args, **kwargs):
        serializer = SignupUserSerializer(data=request.data, partial=True)
        serializer.is_valid()
        user = serializer.save()
        serializer = CustomTokenObtainPairSerializer(
                data={'email': request.data['email'], 'password': request.data['password1']})
        if serializer.is_valid():
            return Response(serializer.validated_data, status=status.HTTP_201_CREATED)

class ChangeUserInfoMixin:
    def change_nickname_service(self, request, *args, **kwargs):
        serializer = ChangeUserNicknameSerializer(request.user, data=request.data, partial=False)
        serializer.is_valid(raise_exception=True)
        if authenticate(**serializer.validated_data) is not None:
            serializer.save()
            return Response({'nickname': request.user.nickname}, status=status.HTTP_206_PARTIAL_CONTENT)
        else:
            return Response({'password': 'password is not correct'}, status=status.HTTP_401_UNAUTHORIZED)

    def change_password_service(self, request, *args, **kwargs):
        serializer = ChangeUserPasswordSerializer(request.user, data=request.data, partial=False)
        serializer.is_valid(raise_exception=True)
        if authenticate(**serializer.validated_data) is None:
            return Response({'password': 'password is not correct'}, status=status.HTTP_401_UNAUTHORIZED)
        else:
            serializer.save()
            return Response({'password': 'password changed successfully'}, status=status.HTTP_206_PARTIAL_CONTENT)
