# Generated by Django 3.1.7 on 2021-03-22 05:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('slug', models.CharField(max_length=200, unique=True)),
                ('image', models.CharField(blank=True, max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('email', models.CharField(max_length=100)),
                ('subject', models.TextField()),
                ('message', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('slug', models.CharField(max_length=200, unique=True)),
                ('price', models.IntegerField()),
                ('discounted_price', models.IntegerField(default=0)),
                ('description', models.TextField()),
                ('status', models.CharField(choices=[('In', 'In Stock'), ('Out', 'Out Of Stock')], max_length=50)),
                ('label', models.CharField(choices=[('new', 'New Product'), ('hot', 'Hot Product'), ('sale', 'Sale Product')], default='new', max_length=200)),
                ('image', models.TextField(blank=True)),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cart.category')),
            ],
        ),
    ]
