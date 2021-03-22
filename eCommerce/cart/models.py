# Create your models here.
from django.db import models
from django.shortcuts import reverse
#vlaue, name
STATUS = (('In', 'In Stock'),('Out', 'Out Of Stock'))
LABEL = (('new', 'New Product'), ('hot', 'Hot Product'), ('sale', 'Sale Product'))

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=200)
    slug = models.CharField(max_length= 200, unique=True)
    image = models.CharField(max_length=200, blank= True)

    def __str__(self):
        return self.name

# class Slider(models.Model):
#     name = models.CharField(max_length=300)
#     image = models.TextField()
#     description = models.TextField()
#     url = models.TextField(blank = True)

#     def __str__(self):
#         return self.name

# class Brand(models.Model):
#     name = models.CharField(max_length=200)
#     image = models.TextField()
#     rank = models.IntegerField()

#     def __str__(self):
#         return self.name

class Product(models.Model):
    name = models.CharField(max_length=200)
    slug = models.CharField(max_length=200, unique= True)
    price = models.IntegerField()
    #default = 0 ; ????
    discounted_price = models.IntegerField(default = 0)
    description = models.TextField()
    category = models.ForeignKey(Category, on_delete = models.CASCADE)
    # brand = models.ForeignKey(Brand, on_delete= models.CASCADE)
    status = models.CharField(max_length=50, choices = STATUS)
    label = models.CharField(max_length=200, choices= LABEL, default= 'new') #or blank = True
    image = models.TextField(blank=True)

    def __str__(self):
        return self.name

    def get_url(self):
        return reverse ('home:product', kwargs = {'slug': self.slug})
#        urls home vanne app ko 'product' vanne url ma jane Yo 'slug' liyera
#   'home:product' make sure there is no space inbetween

    def get_cart_url(self):
        return reverse ('home:add-to-cart', kwargs = {'slug': self.slug})

#-----------cart----------------
# class Cart(models.Model):
#     item = models.ForeignKey(Product, on_delete = models.CASCADE)
#     slug = models.CharField(max_length= 100)
#     quantity = models.IntegerField(default=1)
#     user = models.CharField(max_length = 200)
#     # date = models.DateTimeField
#     total = models.IntegerField(null = True)

#     def __str__(self):
#         return self.user

#     def delete_cart_url(self):
#         return reverse ('home:delete-cart-item', kwargs = {'slug': self.slug})

#     def minus_cart_url(self):
#         return reverse ('home:minus-cart-item', kwargs = {'slug': self.slug})


class Contact(models.Model):
    name = models.CharField(max_length= 200)
    email = models.CharField(max_length= 100)
    phone = models.CharField(max_length = 20 , null = True, blank = False)
    address = models.CharField(max_length = 100, null = True, blank = False )

    def __str__(self):
        return self.name
