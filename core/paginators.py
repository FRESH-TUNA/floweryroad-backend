from rest_framework.pagination import PageNumberPagination

class FlowerPaginator(PageNumberPagination):
    page_size = 10
    
class CommentPaginator(PageNumberPagination):
    page_size = 4
