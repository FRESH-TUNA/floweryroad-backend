from rest_framework import status
from rest_framework.views import APIView

from core.models import Flower
from core.serializers.flowerSerializers import FlowerListSerializer
# from jockbo.apps.common.models import Post, Comment
# from jockbo.apps.common.permissions import IsOwnerOrReadOnly
from rest_framework.response import Response
# from rest_framework.permissions import IsAuthenticatedOrReadOnly

class FlowerList(APIView):
    # permission_classes = (IsAuthenticatedOrReadOnly,)

    def get(self, request):
        flowers = Flower.objects.all()
        serializer = FlowerListSerializer(flowers, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request, postPk=None):
        serializer = CommentSerializer(data=request.data)
        try:
            serializer.is_valid()
            serializer.save(user=request.user, post=Post.objects.get(id=postPk))
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        except:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

class FlowerDetail(APIView):
    def get_object(self, commentPk):
        return Comment.objects.get(id=commentPk)

    def put(self, request, commentPk, format=None):
        try:
            comment = self.get_object(commentPk)
            serializer = CommentSerializer(comment, data=request.data)
            serializer.is_valid()
            serializer.save()
            return Response(serializer.data, status=status.HTTP_202_ACCEPTED)
        except Comment.DoesNotExist:  
            return Response({'error':'comment is not existed'}, status=status.HTTP_400_BAD_REQUEST)
        except:  
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, commentPk, format=None):
        try:
            snippet = self.get_object(commentPk)
            snippet.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
        except:
            return Response({'error':'comment is not existed'}, status=status.HTTP_400_BAD_REQUEST)