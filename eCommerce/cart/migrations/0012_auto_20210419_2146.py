# Generated by Django 3.1.4 on 2021-04-19 16:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cart', '0011_auto_20210419_2139'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='customer',
            name='confpassword',
        ),
        migrations.RemoveField(
            model_name='customer',
            name='password',
        ),
        migrations.AlterField(
            model_name='customer',
            name='username',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
