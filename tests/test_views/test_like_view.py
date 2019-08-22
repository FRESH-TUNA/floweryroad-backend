from django.test import TestCase
from core.models import Comment, Flower, CommentLike
from flauth.models import User
from django.db import models
from django.test import Client
import json

class CommentViewTest(TestCase):
    c = Client()
    headers = {'Authorization': None}

    def setUp(self):
        user=User.objects.create_user(email="logo@gmail.com", password="1234")
        
        flower= Flower.objects.create(
            name = '호호',
            description = '세상에',
            season = 0
        )

        comment= Comment.objects.create(
            user=user, 
            flower=flower, 
            content='test',
            star=3.5
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
    
    def test_create_delete_like(self):
        response = self.c.post(
            '/comments/1/likes', 
            content_type="application/json",
            HTTP_AUTHORIZATION=self.headers['Authorization'],
        )

        self.assertEqual(response.status_code, 201)
        self.assertEqual(CommentLike.objects.get(id=1).like, True)

        response = self.c.delete(
            '/comments/1/likes', 
            HTTP_AUTHORIZATION=self.headers['Authorization'],
        )

        self.assertEqual(response.status_code, 204)
        # self.assertEqual(CommentLike.objects.count(), True)
        self.assertEqual(CommentLike.objects.get(id=1).like, False)

        

        