from rest_framework.routers import DefaultRouter, DynamicRoute, Route
from auth.views import AuthViewSet

class AuthRouter(DefaultRouter):
    routes = [
        # Dynamically generated detail routes. Generated using
        # @action(detail=True) decorator on methods of the viewset.

        Route(
            url=r'^{prefix}{trailing_slash}$',
            mapping={},
            name='',
            detail=False,
            initkwargs={}
        ),
        DynamicRoute(
            url=r'^{url_path}{trailing_slash}$',
            name='{basename}-{url_name}',
            detail=True,
            initkwargs={}
        )
    ]

# base 이름은 view의 단축이름을 만들때 사용한다.
auth_router = AuthRouter(trailing_slash=False)
auth_router.register(r'auth', AuthViewSet, basename='auth')
