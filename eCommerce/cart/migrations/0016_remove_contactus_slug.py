# Generated by Django 3.1.4 on 2021-04-20 07:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cart', '0015_contactus_slug'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='contactus',
            name='slug',
        ),
    ]