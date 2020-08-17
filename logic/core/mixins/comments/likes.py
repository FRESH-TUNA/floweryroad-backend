import logging

class CreateModelMixin:   
    def create(self, request, *args, **kwargs):
        logging.error("hoiho")
        instance = self.get_or_create_object()
        self.perform_create(instance)
        return Response(
            {
                "is_like": True,
                "count": CommentLike.objects.all().filter(
                    comment=Comment.objects.get(id=pk),
                    like=True
                ).count()
            }, status=status.HTTP_201_CREATED
        )
    
    def perform_create(self, instance):
        instance.like = True
        instance.save()

class DestroyModelMixin:
    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response(
            {
                "is_like": False,
                "count": CommentLike.objects.all().filter(
                    comment=Comment.objects.get(id=pk),
                    like=True
                ).count()
            }, status=status.HTTP_204_NO_CONTENT
        )

    def perform_destroy(self, instance):
        instance.like = False
        instance.save()        
