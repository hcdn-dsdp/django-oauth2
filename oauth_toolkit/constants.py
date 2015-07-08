### Constants 
CREDENTIALS_KEY_CONST="Credential "
AUTH_HEADER_KEY_CONST='HTTP_AUTHORIZATION'
IS_VALID_KEY_CONST='is_valid'
PASS_CHANGED_KEY_CONST='pass_changed'
STATUS_KEY_CONST='status'
CANT_PARAM_CONST=2

### Logger
STATUS_CODE_LOG="Response_status_code={0}"
LOGGING_FOLDER_EXC="No permission to log"
LOGGING_FOLDER_EXC_MSG="\n \
*******************************************************************************************\n \
* ERROR - No permissions on Logging folder, or it does not exists. Should set environment.*\n \
*******************************************************************************************\n"

####################### ROLL PERMISSION QUERY FORMAT
ROLE_QUERY_CODENAME="{0}.{1}_{2}_{3}_{4}" 
APP_CODENAME='Autenticador'
TOKEN_DOES_NOT_EXIST="Token inexistente en la base de datos"
TOKEN_ERROR="Error al buscar el token a la base de datos"
IS_AUTHORIZED='is_authorized'

#####################################################



### PERMISSION ERRORS
AUTH_HEADER_KEY_ERROR="Header invalido, vacio o inexistente"
CREDENTIAL_KEY_ERROR="Credential invalido, vacio o inexistente."
SECRET_ERROR="client_secret invalido. Request_client_secret={0} - Stored_client_secret={1}."
CLIENT_OR_SECRET_ERROR="client_id, client_secret invalidos. client_id={0} - client_secret={1}."
NO_TOKEN_ERROR="No hay token en el request."
INVALID_TOKEN_ERROR="Token invalido o expirado."
NO_CUIL_OR_EMAIL_ERROR="Argumentos incompletos, falta CUIL o email."
NO_CUIL_ERROR="No se encontro el argumento CUIL."
INVALID_CUIL_ERROR="CUIL invalido o inexistente"
PASSWORD_CHANGE_ERROR="NO se cambio el PASSWORD: token={0}"
NO_PERMISSION_EXC="Sin permisos para realizar esta peticion."
INVALID_ARGS="Argumentos invalidos o faltantes"

## SERVICES
TOKEN_INFO="TOKEN: request_token={0} - USER: fullname={1}; email={2}"
PASSWORD_CHANGED="Se cambio el PASSWORD correctamente: token={0} - USER: fullname={1}; email={2}"

## PERMISION
HAS_PERMISSION_GRANTED="HasPermission dio permisos para client_id={0}, request_secret={1}, stored_secret={2}."
VALID_TOKEN="Token valido."

INFO_RESPONSE_OK="Se ha dado la informacion del usuario"
INFO_RESPONSE_NO_FUNCTION="Se ha dado informacion del usuario sin Estructura ni funcion"
INFO_RESPONSE_ERROR="Error al intentar obtener la informacion de usuario"
INFO_NO_CUIL_OR_EMAIL_ERROR="Argumentos incorrectos. Falta cuil o email"
DB_APP_EXCEPTION_ERROR="Problemas para obtener app info de la base de datos"
INFO_NO_CUIL="Falta CUIL como argumento"
INFO_MAIL_INCONSISTENT="Email pasado como argumento no es igual al guardado en la BD"
INFO_MAIL_INCONSISTENT_NO_MAIL="Email pasado como argumento no es igual al guardado en la BD. ERROR al enviar email al Area de comunicacion"
DB_RECOVERY_EXCEPTION_CUIL="CUIL inexistente en la base de datos"
DB_RECOVERY_EXCEPTION="Problemas al conectarse con BD "
DB_CUIL_INFO_EXCEPTION="Impsible conectarse con BD"
RECOVERY_OK="Se ha enviado mail de recuperar constrasena correctamente."
RECOVERY_FAIL="No se pudo enviar el mail para recuperar contrasena."
BEARER_KEY="Bearer "
PASSWORD_KEY='password'
TOKEN_KEY='token'
RESOURCE_KEY='resource'
EMAIL_KEY='email'
CUIL_KEY='cuil'
NAME_KEY='nombre'
LAST_NAME_KEY='apellido'
EMAIL_KEY='email'
ID_FUNCION='id_funcion'
FUNCION='funcion'
ID_ESTRUCTURA='id_estructura'
ESTRUCTURA='estructura'
DEPARTAMENTO='departamento'
CONTACTO='contacto'
SERVICE_KEY='service'
METHOD_TYPE_KEY= 'method_type'
APP_ID= 'app_id'


#### Response status code
OK_CODE=200
OK_SIN_FUNCION=201

MISSING_TOKEN_CODE=432
EXPIRED_TOKEN_CODE=433
NO_PERMISSION_EXC_CODE=434
MISSING_EMIAL_OR_CUIL=435
MAIL_INCONSISTENT=436
MAIL_INCONSISTENT_NO_MAIL=437
MISSING_CUIL=438
INVALID_ARGS_REQ = 439

DB_TOKEN_EXCEPTION_CODE=512
DB_CHANGE_PASS_EXCEPTION_CODE=513
DB_RECOVERY_EXCEPTION_CODE=515
CANT_SEND_EMAIL_CODE=516
DB_CUIL_EXCEPTION_CODE=517
DB_RECOVERY=518
DB_APP_EXCEPTION_CODE=519
DB_TOKEN_DOES_NOT_EXISTE_CODE=520
DB_TOKEN_ERROR_CODE=521
#Logging
LOG_PROPERTIES='/opt/release/release1.3.0.0/authenticator/oauth_toolkit/properties.json'