from django.test import TestCase
from core.models import Comment, Flower
from flauth.models import User
from django.db import models
from django.test import Client
import json

class CommentViewTest(TestCase):
    c = Client()
    headers = {'Authorization': None}

    def setUp(self):
        User.objects.create_user(email="logo@gmail.com", password="1234")
        
        Flower.objects.create(
            name = '호호',
            description = '세상에',
            season = 0
        )

        response = self.c.post(
            '/signin', 
            json.dumps({
                'email': 'logo@gmail.com',
                'password': '1234',
            }),
            content_type="application/json",
        )
        self.headers['Authorization']  = 'Bearer ' + response.data['access']
    
    def test_create_comment(self):
        response = self.c.post(
            '/flowers/1/comments', 
            json.dumps({
                'content': 'hohohehe',
                'star': 3.0,
            }),
            content_type="application/json",
            HTTP_AUTHORIZATION=self.headers['Authorization'],
            follow=True
        )

        self.assertEqual(response.status_code, 200)