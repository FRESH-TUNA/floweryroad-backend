from rest_framework.viewsets import ViewSet
from rest_framework.serializers import Serializer
from rest_framework.decorators import action
from rest_framework_simplejwt.views import TokenObtainPairView

from auth.serializers import CustomTokenObtainPairSerializer
from auth.mixins import *

class SigninViewSet(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer

class AuthViewSet(SignupMixin, ChangeUserInfoMixin, ViewSet):
    serializer_class = Serializer

    @action(detail=True, methods=['post'])
    def signup(self, request, *args, **kwargs):
        return self.signup_service(request, *args, **kwargs)

    @action(detail=True, methods=['put'])    
    def nickname(self, request, *args, **kwargs):
        return self.change_nickname_service(request, *args, **kwargs)
    
    @action(detail=True, methods=['put'])
    def password(self, request, *args, **kwargs):
        return self.change_password_service(request, *args, **kwargs)