from django.db import models
from django.utils import timezone
from django.contrib.auth.models import (BaseUserManager, AbstractBaseUser)
from core.models import (Purpose, Color)
import logging

class UserManager(BaseUserManager):
    def create_user(self, **kwargs):
        if not "email" in kwargs:
            raise ValueError('Users must have an email address')
        if not "password" in kwargs:
            raise ValueError('Users must have an password')

        user = self.model(
            email=self.normalize_email(kwargs.get("email")),
        )
        user.set_password(self.normalize_email(kwargs.get("password")))
        user.save(using=self._db)
        return user

    def create_superuser(self, **kwargs):
        if not "email" in kwargs:
            raise ValueError('Users must have an email address')
        if not "password" in kwargs:
            raise ValueError('Users must have an password')

        user = self.model(
            email=self.normalize_email(kwargs.get("email")),
        )
        user.set_password(self.normalize_email(kwargs.get("password")))
        user.is_admin = True
        user.save(using=self._db)
        return user

    # def create_superuser(self, email, password, nickname, university=None):
    #     user = self.create_user(
    #         email,
    #         password=password,
    #         university=university,
    #         nickname=nickname
    #     )
    #     user.is_admin = True
    #     user.save(using=self._db)
    #     return user


class User(AbstractBaseUser):
    email = models.EmailField(
        verbose_name='email',
        max_length=255,
        unique=True,                                #username으로 쓰고싶은것에 반드시 unique 지정
    )
    nickname = models.CharField(max_length=30, blank=True)
    purpose = models.ForeignKey(Purpose, on_delete=models.SET_NULL, null=True, blank=True)
    color = models.ForeignKey(Color, on_delete=models.SET_NULL, null=True, blank=True)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)

    objects = UserManager()

    USERNAME_FIELD = 'email'                       #username으로 사용된다. 반드시 unique일것
    # REQUIRED_FIELDS = ['nickname']                  #when command line createsuperuser시만 적용된다.

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    @property
    def is_staff(self):
        return self.is_admin