# -*- coding: utf-8 -*-
from rest_framework.response import Response
from rest_framework.views import APIView
from oauth2_provider.models import AccessToken, Application
from authenticators.authorizator import HasPermission, HasTokenPermission, HasInfoPermission, hand_unauthorized_exc
from oauth_toolkit import constants
from django.conf import settings
from django.core.mail import send_mail
from hashlib import sha512
from uuid import uuid4
import datetime
from django.utils import timezone
from django.core.exceptions import ObjectDoesNotExist
from django.utils.encoding import smart_str, smart_unicode
from django.contrib.auth.models import User
import logging
    
class TokenValidatorView(APIView):
    """
        Provee informacion sobre el token pasado por parametro.
        
        Return: info about whether the token is valid or not.
        
        Args: token. 
    """
    permission_classes = (HasPermission,)
    
    def get(self, request, *args, **kwargs):
        """
        Provee informacion
        """
        logger = logging.getLogger('oauth_toolkit')
        
        if constants.TOKEN_KEY not in kwargs: 
            logger.debug(constants.INVALID_TOKEN_ERROR)
            return self.response(False, constants.MISSING_TOKEN_CODE)
               
        try:
            ts = AccessToken.objects.get(token=kwargs[constants.TOKEN_KEY])
            
            logger.debug(constants.TOKEN_INFO.format(smart_str(ts), smart_str(ts.user.get_full_name()), smart_str(ts.user.email)))
        
            return self.response(False, constants.EXPIRED_TOKEN_CODE) if ts.is_expired() else self.response(True, constants.OK_CODE)
            
        except Exception:
            return self.response(False, constants.DB_TOKEN_EXCEPTION_CODE)
        
    
    
    
    def response(self, bool_r, _status):
        logger = logging.getLogger('oauth_toolkit')
        
        logger.debug(constants.STATUS_CODE_LOG.format(str(_status))) 
        #print constants.STATUS_CODE_LOG.format(str(_status))  
        return Response(data={constants.IS_VALID_KEY_CONST: bool_r} ,status=_status)

    @hand_unauthorized_exc
    def handle_exception(self, exc):
        super(TokenValidatorView, self).handle_exception(exc)

class PasswordManagerView(APIView):
    """
        Modifica password
        
        Return: info about whether the token is valid or not.
        
        Args: token. 
    """
    permission_classes = (HasTokenPermission,)
    
    def put(self, request, *args, **kwargs):
        """
        Provee informacion
        """
        # next lines validated by HasTokenPermission
        _token = request.META[constants.AUTH_HEADER_KEY_CONST].replace(constants.BEARER_KEY, "")
        _new_pass = request.DATA[constants.PASSWORD_KEY]
        logger = logging.getLogger('oauth_toolkit')
        try:
            user = AccessToken.objects.get(token=_token).user
            user.set_password(_new_pass)
            user.save()
            logger.debug(constants.PASSWORD_CHANGED.format(smart_str(_token), smart_str(user.get_full_name()), smart_str(user.email)))
        except:
            logger.debug(constants.PASSWORD_CHANGE_ERROR.format(smart_str(_token)))
            return Response({constants.IS_VALID_KEY_CONST: False}, status=constants.DB_CHANGE_PASS_EXCEPTION_CODE)
        
        return Response({constants.IS_VALID_KEY_CONST: True}, status=constants.OK_CODE)
                
    @hand_unauthorized_exc
    def handle_exception(self, exc):
        super(PasswordManagerView, self).handle_exception(exc)
        
class PassRecoveryView(APIView):
    """
        Provee informacion sobre el usuario
        
        Args: cuil identificador del usuario. 
    """
    permission_classes = (HasPermission,) 
    
    def get(self, request, *args, **kwargs):       
        """
        Provee informacion
        """
        
        logger = logging.getLogger('oauth_toolkit')
        
        if constants.EMAIL_KEY not in kwargs or constants.CUIL_KEY not in kwargs: 
            logger.debug(constants.NO_CUIL_OR_EMAIL_ERROR)
            return Response(data=constants.INFO_NO_CUIL_OR_EMAIL_ERROR, status=constants.MISSING_EMIAL_OR_CUIL)
        
        cuil = kwargs[constants.CUIL_KEY]
        mail = kwargs[constants.EMAIL_KEY]
        
        client_id, client_secret = self.get_info_client(request)
        sent=0
        try:
            user = User.objects.get(username=cuil)
            
            #same email address?
            if mail != user.email:
                # TODO enviar mail a COMUNICACION
                # user.get_username(), user.first_name, user.last_name, user.email, mailconstants.EMAIL_KEY: user.email,
                #\nCUIL:{0} \nNombre:{1} \nApellido: {2} \nEmail-bd:{3} \nEmail-nuevo:{4}"
                # self.send_email(settings.EMAIL_RECOVERY_RESPONSIBLE, __token)
                logger.debug(constants.INFO_MAIL_INCONSISTENT)
                
                sent = send_mail(settings.EMAIL_SUBJECT, settings.EMAIL_MESSAGE_EXCEPTION.format(smart_str(user.get_username()), smart_str(user.first_name), smart_str(user.last_name), smart_str(user.email), smart_str(mail)), settings.EMAIL_HOST_USER, [settings.EMAIL_RECOVERY_RESPONSIBLE], fail_silently=False)
           
                if sent == 1:    
                    return Response(data=constants.INFO_MAIL_INCONSISTENT, status=constants.MAIL_INCONSISTENT)
                return Response(data=constants.INFO_MAIL_INCONSISTENT_NO_MAIL, status=constants.MAIL_INCONSISTENT_NO_MAIL)
            
            
            __token = AccessToken.objects.create(user=user, token=str(sha512(uuid4().hex).hexdigest()[0:30]), application=Application.objects.get(client_id=client_id), expires= timezone.now() + datetime.timedelta(days=1), scope='read write')
            
            sent = send_mail(settings.EMAIL_SUBJECT, settings.EMAIL_MESSAGE.format(str(__token)), settings.EMAIL_HOST_USER, [user.email], fail_silently=False)
        
        except ObjectDoesNotExist as ex:
            logger.debug(constants.DB_RECOVERY_EXCEPTION_CUIL + str(ex))
            return Response(data=constants.DB_RECOVERY_EXCEPTION_CUIL, status=constants.DB_RECOVERY_EXCEPTION_CODE)
        except Exception as e:
            logger.debug(constants.DB_RECOVERY_EXCEPTION + str(e))
            return Response(data=constants.DB_RECOVERY_EXCEPTION, status=constants.DB_RECOVERY)

        if sent == 1:
            return Response(data=constants.RECOVERY_OK, status=constants.OK_CODE)
        return Response(data=constants.RECOVERY_FAIL, status=constants.CANT_SEND_EMAIL_CODE)
    
    def get_info_client(self, request):
        return request.META[constants.AUTH_HEADER_KEY_CONST].replace(constants.CREDENTIALS_KEY_CONST, "").split()
        
    def send_email(self, email, msg, tok=None):
        if tok is None:
            return send_mail(settings.EMAIL_SUBJECT, settings.EMAIL_MESSAGE, settings.EMAIL_HOST_USER, [email], fail_silently=False) == 1
        
        return send_mail(settings.EMAIL_SUBJECT, settings.EMAIL_MESSAGE.format(str(tok)), settings.EMAIL_HOST_USER, [email], fail_silently=False) == 1
        

    @hand_unauthorized_exc
    def handle_exception(self, exc):
        super(PassRecoveryView, self).handle_exception(exc)
        
          
        
class UserManagerView(APIView):
    """
        Provee informacion sobre el usuario
        
        Args: cuil identificador del usuario. 
    """
    permission_classes = (HasInfoPermission,)
    
    #Validated by HasInfoPermission
    def getToken(self, request):
        return request.META[constants.AUTH_HEADER_KEY_CONST].replace(constants.BEARER_KEY, "")

    def get(self, request, *args, **kwargs):
        """
        Provee informacion
        """
        logger = logging.getLogger('oauth_toolkit')   
        
        _token = self.getToken(request)
                       
        try:
            ts = AccessToken.objects.get(token=_token)
            user = User.objects.get(username=ts.user)
            logger.debug(constants.TOKEN_INFO.format(ts, smart_str(user.get_full_name()), smart_str(user.email)))
            return self.response(user)
            
        except Exception as e:
            #print str(e)
            return self.response(None)
        
    
    def response(self, user=None):
        #print str(user)
        logger = logging.getLogger('oauth_toolkit')   
        
        if user is not None:
            try:
                _data = {constants.NAME_KEY: user.first_name,
                         constants.LAST_NAME_KEY: user.last_name, 
                         constants.CUIL_KEY: user.get_username(), 
                         constants.EMAIL_KEY: user.email,
                         constants.ID_FUNCION: user.perfildeusuario.cod_funcion,
                         constants.FUNCION: user.perfildeusuario.funcion,
                         constants.ID_ESTRUCTURA: user.perfildeusuario.cod_estructura_real,
                         constants.ESTRUCTURA: user.perfildeusuario.estructura_real,
                         constants.DEPARTAMENTO: user.perfildeusuario.departamento}
                _status=constants.OK_CODE
                logger.debug(constants.INFO_RESPONSE_OK)
            except Exception:
                _data = {constants.NAME_KEY: user.first_name,
                         constants.LAST_NAME_KEY: user.last_name,
                         constants.CUIL_KEY: user.get_username(), 
                         constants.EMAIL_KEY: user.email,
                         constants.ID_FUNCION: None,
                         constants.FUNCION: None,
                         constants.ID_ESTRUCTURA: None,
                         constants.ESTRUCTURA: None,
                         constants.DEPARTAMENTO: None}
                _status=constants.OK_SIN_FUNCION
                logger.debug(constants.INFO_RESPONSE_NO_FUNCTION)
            
            return Response(data=_data, status=_status)
                
        logger.debug(constants.INFO_RESPONSE_ERROR)
        
        return Response(status=constants.DB_TOKEN_EXCEPTION_CODE)
    
    @hand_unauthorized_exc
    def handle_exception(self, exc):
        super(UserManagerView, self).handle_exception(exc)
        
        
class CuilView(APIView):
    """
        Provee informacion sobre el usuario
        
        Args: cuil identificador del usuario. 
    """
    permission_classes = (HasPermission,) 
    
    def get(self, request, *args, **kwargs):
        """
        Provee informacion de si el cuil existe o no
        """
        logger = logging.getLogger('oauth_toolkit')
        
        if constants.CUIL_KEY not in kwargs: 
            logger.debug(constants.NO_CUIL_ERROR)
            return Response(data=constants.INFO_NO_CUIL, status=constants.MISSING_CUIL)
        
        cuil = kwargs[constants.CUIL_KEY]
        try:
            user = User.objects.get(username=cuil)
        except ObjectDoesNotExist:
            return Response(data={constants.IS_VALID_KEY_CONST: False}, status=constants.OK_CODE)
        except Exception as e:
            logger.debug(constants.DB_CUIL_INFO_EXCEPTION + str(e))
            return Response(data=constants.DB_CUIL_INFO_EXCEPTION, status=constants.DB_CUIL_EXCEPTION_CODE)
        
        
        try:
            pu = user.perfildeusuario
        except:
            pu = None
            
        return Response(data={constants.IS_VALID_KEY_CONST: True,
                              constants.NAME_KEY: user.first_name,
                              constants.LAST_NAME_KEY: user.last_name, 
                              constants.EMAIL_KEY: user.email,
                              constants.FUNCION: None if pu is None else pu.funcion,
                              constants.ESTRUCTURA: None if pu is None else pu.estructura_real,
                              constants.DEPARTAMENTO: None if pu is None else pu.departamento,
                              constants.CONTACTO: None if pu is None else pu.contacto
                              }, status=constants.OK_CODE)
    
    
    @hand_unauthorized_exc
    def handle_exception(self, exc):
        super(CuilView, self).handle_exception(exc)
        

class HasPermissionView(APIView):
    """
        Provee informacion sobre los permisos de usuarios
        
        IMPORTANTE: en la base de datos se agregan los roles de la siguiendte manera: <ClientAppName>_<ServiceName>_<HttpMethodType>_<Resource>
                    por ejemplo para obtener los expedientes desde los servicios parlamentarios el permiso quedaria: spd_expedientes_get_servicios
                    Y para hacer una consulta sobre permisos, utilizando el metodo user.has_perm(param) utilizando el siguiente formato para
                    el parametro param: <AuthenticatorAPP>.<ClientAppName>_<ServiceName>_<HttpMethodType>_<Resource> como por ejemplo:
                    oauth2_provider.spd_expedientes_servicios-java_get
    """
    permission_classes = (HasPermission,) 

    def get(self, request, *args, **kwargs):
        
        logger = logging.getLogger('oauth_toolkit')
        
        if constants.SERVICE_KEY not in kwargs or constants.METHOD_TYPE_KEY not in kwargs or constants.TOKEN_KEY not in kwargs: 
            logger.debug(constants.INVALID_ARGS)
            return Response(data=constants.INVALID_ARGS, status=constants.INVALID_ARGS_REQ)
        
        _service = kwargs[constants.SERVICE_KEY]
        _method_type = kwargs[constants.METHOD_TYPE_KEY]
        _token_n = kwargs[constants.TOKEN_KEY]
        _resource = kwargs[constants.RESOURCE_KEY]
        
        _client_id, _client_secret = self.get_info_client(request)
 
        try:
            _tk = AccessToken.objects.get(token=_token_n)
        except ObjectDoesNotExist:
            logger.debug(constants.TOKEN_DOES_NOT_EXIST)
            return Response(status=constants.DB_TOKEN_DOES_NOT_EXISTE_CODE, data=constants.TOKEN_DOES_NOT_EXIST)
        except Exception as e:
            logger.debug(str(e))
            return Response(status=constants.DB_TOKEN_ERROR_CODE, data=constants.TOKEN_ERROR)
        
        _app_name = _tk.application
        
        # ecample: oauth2.spd_expedientes_servicios_get
        _permission_str = constants.ROLE_QUERY_CODENAME.format(constants.APP_CODENAME, _app_name, _service.lower(), _method_type.lower(), _resource) #_resource
        
        _user = _tk.user
    
        _authorized = _user.has_perm(_permission_str)
        
        return Response(data={ constants.IS_AUTHORIZED : _authorized }, status=constants.OK_CODE)
    
    def get_info_client(self, request):
        return request.META[constants.AUTH_HEADER_KEY_CONST].replace(constants.CREDENTIALS_KEY_CONST, "").split()
        
    @hand_unauthorized_exc
    def handle_exception(self, exc):
        super(HasPermissionView, self).handle_exception(exc)
    
    
    
        

