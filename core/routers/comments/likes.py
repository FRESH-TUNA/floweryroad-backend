from rest_framework.routers import Route, SimpleRouter
from core.views import CommentsLikesViewSet

class CommentsLikesRouter(SimpleRouter):
    routes = [
        Route(
            url=r'^{prefix}/{lookup}/likes$',
            mapping={
                'delete': 'destroy',
                'post': 'create'
            },
            name='{basename}-detail',
            detail=True,
            initkwargs={'suffix': 'Detail'}
        ),
    ]

comments_likes_router = CommentsLikesRouter(trailing_slash=False)
comments_likes_router.register(r'comments', CommentsLikesViewSet, basename='comments_likes')