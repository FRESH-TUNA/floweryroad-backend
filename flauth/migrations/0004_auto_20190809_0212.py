# Generated by Django 2.2.4 on 2019-08-09 02:12

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('flauth', '0003_user_deta_joined'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='deta_joined',
            new_name='date_joined',
        ),
    ]
