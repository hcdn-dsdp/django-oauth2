#!/usr/bin/env python
import os
import sys
from oauth_toolkit.utils.logger import Logger
from oauth_toolkit.exceptions.loggingErrors import LoggingFolderException



def run_services():
    
    try:
        Logger().init()
    except LoggingFolderException as e:
        print e.default_detail
        return
        
    Logger().i('*** Starting OAuth2 Server ***')
    
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "oauth_toolkit.settings")
    
    from django.core.management import execute_from_command_line
    
    execute_from_command_line(sys.argv)
    
    ''' Stop the logging thread '''
    Logger().i('*** Stopping OAuth2 Server ***')
    Logger().stop()
    

if __name__ == "__main__":
    run_services()
    