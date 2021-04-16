# Generated by Django 3.1.4 on 2021-04-16 17:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cart', '0003_product_date_created'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='label',
            field=models.CharField(choices=[('New Product', 'New Product'), ('Hot Product', 'Hot Product'), ('Sale Product', 'Sale Product')], default='new', max_length=200),
        ),
        migrations.AlterField(
            model_name='product',
            name='status',
            field=models.CharField(choices=[('In Stock', 'In Stock'), ('Out of Stock', 'Out Of Stock')], max_length=50),
        ),
    ]
