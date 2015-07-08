import logging
import json
import os
import datetime as dt
from utils import singleton
from threading import Thread
from time import sleep
from oauth_toolkit.exceptions.loggingErrors import LoggingFolderException
from oauth_toolkit import constants
from django.utils.encoding import smart_str

@singleton
class Logger(object):
    '''
    classdocs
    
    [INFO] log.i(message)
    [DEBUG] log.d(message)
    [WARNNING] log.w(message)
    [ERROR] log.e(message)
    
    '''
    #class attributes
    _filename='messages.log'
    _format='%(asctime)s [%(levelname)s]: %(message)s'
    _level=logging.INFO
    _datefmt='%m/%d/%Y %I:%M:%S'
    _enable = '1'
    _logger = None
    _thread = None
    _on = True
    
    _LOG_FOLDER_='/var/log/sparl/'
    _LOG_PROPERTIES_ERROR="Properties file not loaded correctly. Using default values."
    
    LEVELS = {'warning': logging.WARNING,
              'info': logging.INFO,
              'debug': logging.DEBUG,
              'error': logging.ERROR,
              'critical': logging.CRITICAL}
    
    def __init__(self):
        pass   
    
    def __del__(self):
        pass
    
    
    def init(self):
        
        self.init_log_folder() #this method could raise a LoggingFolderException
        
        self._logger = logging.getLogger(__name__)
        self.load_properties(constants.LOG_PROPERTIES)
        
        self._thread = Thread(target = self.threaded_function)
        self._thread.setDaemon(True)
        self._thread.start()
        Logger._instance_init = True
        
    def threaded_function(self):
        while self._on:
            self.load_properties(constants.LOG_PROPERTIES)
            sleep(1)    
   
    def init_log_folder(self):
        if not os.path.exists(self._LOG_FOLDER_) or not os.access(self._LOG_FOLDER_, os.W_OK):
            raise LoggingFolderException()
   
    def load_properties(self, properties_file_path):
        try:
            properties_file = open(properties_file_path, 'r')
            properties = json.load(properties_file)
            
            if properties.__contains__('filename'):
                self._filename = self._LOG_FOLDER_ +(dt.datetime.now().strftime("%d-%b-%Y-%H:%M:%S-")) + properties['filename'] 
            if properties.__contains__('format'):
                self._format = properties['format'] 
            if properties.__contains__('level'):
                level_str = properties['level']
                self._level = self.LEVELS.get(level_str, logging.NOTSET)
                logging.getLogger().setLevel(self._level)
            if properties.__contains__('datefmt'):
                self._datefmt = properties['datefmt']
            if properties.__contains__('enable'):
                self._enable = properties['enable']
                if self._enable == '0':
                    logging.disable(logging.WARNING)
                else:
                    logging.disable(logging.NOTSET)
        except:
            self._logger.error(self._LOG_PROPERTIES_ERROR)
            return
                 
        logging.basicConfig(filename=self._filename,
                            format=self._format, 
                            level=self._level,
                            datefmt=self._datefmt)
        self._logger = logging.getLogger()
                            
    def stop(self):
        if self._on:
            self._on = False
            while self._thread.is_alive():
                self._thread.join()
        
                
    def proc_message(self, *args):
        message = ''
        for arg in args:
            str_arg = str(arg)
            if str_arg != None:
                message += str_arg
                message += ' '    
        return message
             
    def e(self,*args):
        '''
        Log error
        '''
        message = self.proc_message(*args)
        self._logger.error(smart_str(message))
    
    def i(self,*args):
        '''
        Log info
        '''
        message = self.proc_message(*args)
        self._logger.info(smart_str(message))
                                
    def w(self,*args):
        '''
        Log warning
        '''
        message = self.proc_message(*args)
        self._logger.warning(smart_str(message))
        
    def d(self,*args):
        '''
        Log debug
        '''
        message = self.proc_message(*args)
        self._logger.debug(smart_str(message))
        
    def setLevel(self,level):
        self._level = self.LEVELS.get(level, logging.NOTSET)
        self._logger.setLevel(self._level)
    
