# Generated by Django 4.2.3 on 2023-09-05 17:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0010_userdetails_account_number'),
    ]

    operations = [
        migrations.AddField(
            model_name='userdetails',
            name='UStatus',
            field=models.TextField(default='pending', null=True),
        ),
    ]
