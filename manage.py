#!/usr/bin/env python
import os
import sys
import logging

def run_services():
    
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "oauth_toolkit.settings")

    logger = logging.getLogger('oauth_toolkit')
        
    from django.core.management import execute_from_command_line
    
    execute_from_command_line(sys.argv)
    
    logger.info('*** Stopping OAuth2 Server ***')

if __name__ == "__main__":
    run_services()
    
