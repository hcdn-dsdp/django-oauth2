from oauth_toolkit import constants
import logging

class NoPermissionException(Exception):
    
    status_code =  constants.NO_PERMISSION_EXC_CODE
    default_detail = constants.NO_PERMISSION_EXC
    logger = logging.getLogger('oauth_toolkit')

    def __init__(self):
        logger.warning(str(constants.NO_PERMISSION_EXC))
        
        Exception.__init__(self, constants.NO_PERMISSION_EXC)
