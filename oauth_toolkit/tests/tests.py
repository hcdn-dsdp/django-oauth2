import json

from django.test import TestCase, RequestFactory
from django.test.client import Client

from django.contrib.auth.models import User#, AccessToken
from oauth2_provider.models import get_application_model
from urllib import urlencode


try:
    from django.contrib.auth import get_user_model
except ImportError:
    from django.contrib.auth.models import User
    get_user_model = lambda: User

UserModel = get_user_model()
AppModel = get_application_model()

class AccessTokenTest(TestCase):
 
    def setUp(self):
        self.factory = RequestFactory()
        self.user = UserModel.objects.create_user("user", "test@user.com", "123456")
        #self.user.save()

        self.application = AppModel.objects.create(
            client_id='client_id', client_secret='client_secret', user=self.user,
            client_type=AppModel.CLIENT_CONFIDENTIAL, authorization_grant_type=AppModel.GRANT_PASSWORD)
        #self.application.save()
        
        self.c = Client()
        
    def tearDown(self):
        self.application.delete()        
            
    def test_fetching_access_token_with_valid_client(self):
        
        data = dict(grant_type=AppModel.GRANT_PASSWORD,
                    client_id=self.application.client_id,
                    client_secret=self.application.client_secret,
                    username=self.user.username,
                    password=self.user.password)
        
        
        self.c.login(username="user", password="123456")
        
        print 'data: '
        print data
        
        #request = self.factory.post('/o/token/',urlencode(data),content_type='application/x-www-form-urlencoded')
        response = self.c.post('/o/token/',urlencode(data),content_type='application/x-www-form-urlencoded')

        
        print 'response: '+str(response)
        
#         auth_headers = {
#             'HTTP_AUTHORIZATION': 'Bearer ' + "a_casual_token",
#         }
#         request = self.factory.get("/fake-resource?next=/fake", **auth_headers)
        
#         response_data = ast.literal_eval(JSONRenderer().render(response.data))
#                 
        #self.assertEqual(resp_status, status.HTTP_400_BAD_REQUEST)
#         self.assertEqual(200, response.status_code, response.content)
#         #self.assertEqual('invalid_client', json.loads(response.content)['error'])
# 
#     
#     def test_fetching_access_token_with_invalid_client(self):
#     
#         response = self.client.post('/o/token/', {
#             'grant_type': 'password',
#             'client_id': self.application.client_id + '123',
#             'client_secret': self.application.client_secret,
#             'username': self.user.username,
#             'password': self.user.password,
#             })
#         
#         self.assertEqual(400, response.status_code, response.content)
#         self.assertEqual('invalid_client', json.loads(response.content)['error'])
# 
#     def test_fetching_access_token_with_invalid_user(self):
#     
#         response = self.client.post('/o/token/', {
#             'grant_type': 'password',
#             'client_id': self.application.client_id,
#             'client_secret': self.application.client_secret,
#             'username': self.user.username + '123',
#             'password': self.user.password,
#             })
#         
#         self.assertEqual(400, response.status_code, response.content)
#         self.assertEqual('invalid_grant', json.loads(response.content)['error'])

