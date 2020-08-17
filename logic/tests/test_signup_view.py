from django.test import TestCase
from core.models import Comment, Flower
from auth.models import User
from django.db import models
from django.test import Client
import json

class SignupViewTest(TestCase):
    def test_signup(self):
        c = Client()
        response = c.post(
            '/signup', 
            json.dumps({
                'email': 'hohohehe@gmail.com',
                'password1': '1234',
                'password2': '1234',
            }),
            content_type="application/json",
        )

        self.assertEqual(response.status_code, 201)
        # self.assertEqual(dict.keys(response.data), ['nickname','access' ,'refresh'])