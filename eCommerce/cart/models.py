# Create your models here.
from django.db import models
from django.shortcuts import reverse
#vlaue, name
STATUS = (('In Stock', 'In Stock'),('Out of Stock', 'Out Of Stock'))
LABEL = (('New Product', 'New Product'), ('Hot Product', 'Hot Product'), ('Sale Product', 'Sale Product'))

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=200)
    slug = models.CharField(max_length= 200, unique=True)
    image = models.CharField(max_length=200, blank= True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return self.name



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
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return self.name

    def get_url(self):
        return reverse ('home:product', kwargs = {'slug': self.slug})
#        urls home vanne app ko 'product' vanne url ma jane Yo 'slug' liyera
#   'home:product' make sure there is no space inbetween

    def get_cart_url(self):
        return reverse ('home:add-to-cart', kwargs = {'slug': self.slug})



class Contact(models.Model):
    name = models.CharField(max_length= 200)
    email = models.CharField(max_length= 100)
    phone = models.CharField(max_length = 20 , null = True, blank = False)
    address = models.CharField(max_length = 100, null = True, blank = False )

    def __str__(self):
        return self.name
