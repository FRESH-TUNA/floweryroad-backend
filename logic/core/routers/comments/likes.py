from rest_framework.routers import Route, SimpleRouter

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
