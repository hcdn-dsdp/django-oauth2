from oauth_toolkit import constants
    


class LoggingFolderException(Exception):
    
    default_detail = constants.LOGGING_FOLDER_EXC
    
    def __init__(self):
        Exception.__init__(self, constants.LOGGING_FOLDER_EXC)
        


