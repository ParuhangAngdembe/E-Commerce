# Generated by Django 3.1.4 on 2021-04-18 15:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cart', '0006_customer_order_orderitem_shippingaddress'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='image',
            field=models.ImageField(upload_to='imagedirectory/'),
        ),
    ]
