from rest_framework.permissions import BasePermission
from oauth2_provider.models import Application
from oauth_toolkit import constants 
from oauth2_provider.models import AccessToken
from oauth_toolkit.exceptions.authorizationErrors import NoPermissionException
from rest_framework.response import Response
import logging

def validate_header_credentials(func):

    def validate(header, request, view): 
        """
        Allows access only to permitted users.
        """
        logger = logging.getLogger('oauth_toolkit')
        
        if constants.AUTH_HEADER_KEY_CONST not in request.META:
            logger.debug(constants.AUTH_HEADER_KEY_ERROR)
            raise NoPermissionException()  

        auth = request.META[constants.AUTH_HEADER_KEY_CONST]
        
        if auth.find(constants.CREDENTIALS_KEY_CONST) is -1:
            logger.debug(constants.CREDENTIAL_KEY_ERROR)
            raise NoPermissionException()
        
        if len(auth.replace(constants.CREDENTIALS_KEY_CONST,"").split()) != constants.CANT_PARAM_CONST:
            logger.debug(constants.CREDENTIAL_KEY_ERROR)
            raise NoPermissionException()
        
        return func(header, request, view)
        
    return validate


class HasPermission(BasePermission):

    logger = logging.getLogger('oauth_toolkit')

    @validate_header_credentials    
    def has_permission(self, request, view):
        
        client_id, client_secret = self.get_client_info(request)
        
        try:
            app = Application.objects.get(client_id=client_id)
            
            if app.client_secret != client_secret:
                logger.debug(constants.SECRET_ERROR.format(str(client_secret), str(app.client_secret)))
                raise NoPermissionException()
        except:
            logger.debug(constants.CLIENT_OR_SECRET_ERROR.format(str(client_id), str(client_secret)))
            raise NoPermissionException()
        
        logger.debug(constants.HAS_PERMISSION_GRANTED.format(str(client_id), str(client_secret), str(app.client_secret)))
        #raise NoPermissionException()
        return True 
    
    def get_client_info(self, request):
        #request content already validated by validate_header function
        return request.META[constants.AUTH_HEADER_KEY_CONST].replace(constants.CREDENTIALS_KEY_CONST,"").split()



def validate_header_bearer(func):

    def validate(header, request, view): 
        """
        Allows access only to permitted users.
        """
        if constants.AUTH_HEADER_KEY_CONST not in request.META:
            raise NoPermissionException()  
        
        auth = request.META[constants.AUTH_HEADER_KEY_CONST]
        
        if auth.find(constants.BEARER_KEY) is -1:
            raise NoPermissionException()
        
        _token = auth.replace(constants.BEARER_KEY, "")
        
        expired = False
        
        try:
            ts = AccessToken.objects.get(token=_token)
            expired = ts.is_expired()
        except:
            raise NoPermissionException()
        
        if expired: 
            raise NoPermissionException()
        
        return func(header, request, view)
        
    return validate

class HasTokenPermission(BasePermission):
    
    @validate_header_bearer
    def has_permission(self, request, view):
        return constants.PASSWORD_KEY in request.DATA
            

class HasInfoPermission(BasePermission):
    
    @validate_header_bearer
    def has_permission(self, request, view):
        return True #validate_header_bearer is enough validation    
    
def hand_unauthorized_exc(func):
    def unauthorized_handler(_self, exc):
        if isinstance(exc, NoPermissionException):
            return Response(data=exc.default_detail, status=exc.status_code, exception=True)
        
        return func(_self, exc)
            
    return unauthorized_handler
