from rest_framework.views import APIView
from rest_framework.response import Response

class APIRoot(APIView):
    def get(self, request):
        data += {
            "users": request.META['HTTP_HOST'] + "/users/",
        }
        return Response(data)