from django.test import TestCase
from core.models import Comment, Flower
from flauth.models import User
from django.db import models
from django.test import Client
import json

class CommentViewTest(TestCase):
    def setUp(self):
        c = Client()
        User.objects.create_user(email="logo@gmail.com", password="1234")
        
        response = c.post(
            '/signin', 
            json.dumps({
                'email': 'logo@gmail.com',
                'password': '1234',
            }),
            content_type="application/json",
        )
        self.headers = {'Authorization': 'Bearer ' + response.data['access']}
    
    def test_change_nickname(self):
        c = Client()
        response = c.put(
            '/nickname', 
            data=json.dumps({
                'email': 'logo@gmail.com',
                'password': '1234',
                'nickname': 'freshTuna',
            }),
            content_type="application/json",
            HTTP_AUTHORIZATION=self.headers['Authorization'],
        )

        self.assertEqual(response.status_code, 206)
        self.assertEqual(User.objects.get(email="logo@gmail.com").nickname, 'freshTuna')

    def test_change_password(self):
        c = Client()
        response = c.put(
            '/password', 
            data=json.dumps({
                'email': 'logo@gmail.com',
                'password': '1234',
                'password1': '12345',
                'password2': '12345',
            }),
            content_type="application/json",
            HTTP_AUTHORIZATION=self.headers['Authorization'],
        )

        self.assertEqual(response.status_code, 206)

        response = c.post(
            '/signin', 
            json.dumps({
                    'email': 'logo@gmail.com',
                    'password': '12345',
            }),
            content_type="application/json"
        )

        self.assertEqual(response.status_code, 200)