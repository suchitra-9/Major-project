# Generated by Django 4.2.3 on 2023-09-05 15:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0007_chequedetails_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='chequedetails',
            name='Reason',
            field=models.TextField(null=True),
        ),
    ]
