
def singleton(class_):
    
    instances = {}
    
    def getinstance(*args, **kwargs):
        if class_ not in instances:
            instances[class_] = class_(*args, **kwargs)
        return instances[class_]
  
    return getinstance            
  
                
        
        
    
    
# TEST SINGLETON
# @singleton
# class Test():
#     def __init__(self, x):
#         self.x = x
#     a = "yes"
#     b = 1
#     
# print "Comienzo"
# x = Test(10)
# print "x >>>> ('x',{0:d}) ('a', {1:s}) ('b', {2:d})".format(x.x, x.a, x.b) 
# x.a = "Modificado!!!!!!"
# y = Test(100)
# print "y >>>> ('x',{0:d}) ('a', {1:s}) ('b', {2:d})".format(y.x, y.a, y.b)
# #y.a = "Modificado de vuelta :)"
# print "x >>>> ('x',{0:d}) ('a', {1:s}) ('b', {2:d})".format(x.x, x.a, x.b)
# print "Fin"
