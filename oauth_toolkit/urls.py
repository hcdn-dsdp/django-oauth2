from django.conf.urls import patterns, url, include
from django.contrib import admin

admin.autodiscover()
from rest_framework import routers
from views import TokenValidatorView, PasswordManagerView, UserManagerView, PassRecoveryView, CuilView, HasPermissionView



# ViewSets define the view behavior.
# class UserViewSet(viewsets.ModelViewSet):
#     permission_classes = [permissions.IsAuthenticated, TokenHasReadWriteScope]
#     model = User
# 
# 
# class GroupViewSet(viewsets.ModelViewSet):
#     permission_classes = [permissions.IsAuthenticated, TokenHasScope]
#     required_scopes = ['groups']
#     model = Group


# Routers provide an easy way of automatically determining the URL conf
router = routers.DefaultRouter()
# router.register(r'users', UserViewSet)
# router.register(r'groups', GroupViewSet)


# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browseable API.
urlpatterns = patterns('',
    url(r'^', include(router.urls)),
    url(r'^o/', include('oauth2_provider.urls', namespace='oauth2_provider')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^o/validate_token/(?P<token>[^/]+)/$', TokenValidatorView.as_view()), #/(?P<token>[^/]+)/$
    url(r'^o/change_password/', PasswordManagerView.as_view()),
    url(r'^o/info_user/', UserManagerView.as_view()),
    url(r'^o/recover_password/(?P<cuil>[^/]+)/(?P<email>[^/]+)/$', PassRecoveryView.as_view()),
    url(r'^o/has_permission/(?P<service>[^/]+)/(?P<resource>[^/]+)/(?P<method_type>[^/]+)/(?P<token>[^/]+)/$', HasPermissionView.as_view()),
    url(r'^o/info_cuil/(?P<cuil>[^/]+)/$', CuilView.as_view()),
)
