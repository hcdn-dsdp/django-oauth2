from oauth_toolkit import constants
from oauth_toolkit.utils.logger import Logger

class NoPermissionException(Exception):
    
    status_code =  constants.NO_PERMISSION_EXC_CODE
    default_detail = constants.NO_PERMISSION_EXC
    
    def __init__(self):
        Logger().w(str(constants.NO_PERMISSION_EXC))
        
        Exception.__init__(self, constants.NO_PERMISSION_EXC)
