from django.test import TestCase
from flauth.models import User
from django.db import models
from django.test import Client
import json

class FlauthTestCase(TestCase):
    def setUp(self):
        User.objects.create_user(email="logo@gmail.com", password="1234")

    def test_signin(self):
        c = Client()

        response = c.post(
            '/token', 
            json.dumps({
                    'email': 'logo@gmail.com',
                    'password': '1234',
            }),
            content_type="application/json"
        )

    def test_signup(self):
        c = Client()
        response = c.post(
            '/signup', 
            json.dumps({
                    'email': 'test@gmail.com',
                    'password1': '1234',
                    'password2': '1234',
            }),
            content_type="application/json"
        )

        response = c.post(
            '/signin', 
            json.dumps({
                    'email': 'test@gmail.com',
                    'password': '1234',
            }),
            content_type="application/json"
        )
        # self.assertEqual(response.data['access'], '한양대학교')     #token의 유무만 판단하는 용도로 사용
        # self.assertEqual(response.data['refresh'], '한양대학교')    #token의 유무만 판단하는 용도로 사용
    def test_inspect_token(self):
        c = Client()

        response = c.post('/signin', 
                json.dumps({
                    'email': 'logo@gmail.com',
                    'password': '1234',
                }),
                content_type="application/json")

        response = c.post('/token/verify',
                json.dumps({'token': response.data['access']}),
                content_type="application/json")

        self.assertEqual(response.status_code, 200)
    
    def test_refresh_token(self):
        c = Client()

        response = c.post('/signin', 
                json.dumps({
                    'email': 'logo@gmail.com',
                    'password': '1234',
                }),
                content_type="application/json")

        response = c.post('/token/refresh',
                json.dumps({'refresh': response.data['refresh']}),
                content_type="application/json")

        self.assertEqual(response.status_code, 200)