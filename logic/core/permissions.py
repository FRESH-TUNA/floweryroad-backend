from rest_framework.permissions import BasePermission, IsAuthenticated, SAFE_METHODS
from rest_framework.response import Response
from rest_framework.views import APIView

class PostDeleteOnly(BasePermission):
    def has_permission(self, request, view):
        return request.method in ('POST', 'DELETE')

class GetDeleteOnly(BasePermission):
    def has_permission(self, request, view):
        return request.method in ('GET', 'DELETE')

class DeleteOnly(BasePermission):
    def has_permission(self, request, view):
        return request.method == 'DELETE'

class HasObjectPermission(BasePermission):
    def has_object_permission(self, request, view, obj):
        # check if user is owner
        return request.user == obj.user

class ReadOnly(BasePermission):
    def has_permission(self, request, view):
        return bool(request.method in SAFE_METHODS)
