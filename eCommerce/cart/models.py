# Create your models here.
from django.db import models
from django.shortcuts import reverse
from django.contrib.auth.models import User
#vlaue, name
STATUS = (('In Stock', 'In Stock'),('Out of Stock', 'Out Of Stock'))
LABEL = (('New Product', 'New Product'), ('Hot Product', 'Hot Product'), ('Sale Product', 'Sale Product'))


class Customer(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)
    username = models.CharField(max_length=200, null=True)
    email = models.CharField(max_length=200, null=True)

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(max_length=200)
    slug = models.CharField(max_length= 200, unique=True)
    
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
    image = models.ImageField(null = False, blank=True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return self.name

    def get_url(self):
        return reverse ('home:product', kwargs = {'slug': self.slug})
#        urls home vanne app ko 'product' vanne url ma jane Yo 'slug' liyera
#   'home:product' make sure there is no space inbetween

    def get_cart_url(self):
        return reverse ('home:add-to-cart', kwargs = {'slug': self.slug})

class Order(models.Model):
    customer = models.ForeignKey(Customer, on_delete = models.SET_NULL, blank=True, null=True)
    date_ordered = models.DateTimeField(default=False, null=True, blank=False)
    transaction_id = models.CharField(max_length=200, null=True)

    def __str__(self):
        return self.transaction_id
    
    @property
    def get_cart_total(self):
        orderitems = self.orderitem_set.all()
        total = sum([item.get_total for item in orderitems])
        return total
    
    @property
    def get_cart_items(self):
        orderitems = self.orderitem_set.all()
        total = sum([item.quantity for item in orderitems])
        return total

class OrderItem(models.Model):
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, blank=True, null=True)
    order = models.ForeignKey(Order, on_delete=models.SET_NULL, blank=True, null=True)
    quantity = models.IntegerField(default=0, null=True, blank=True)
    date_added = models.DateTimeField(auto_now_add=True)

    @property
    def get_total(self):
        total = self.product.price * self.quantity
        return total

class ShippingAddress(models.Model):
    customer= models.ForeignKey(Customer, on_delete=models.SET_NULL, blank=True, null=True)
    order = models.ForeignKey(Order, on_delete=models.SET_NULL, blank=True, null=True)
    address = models.CharField(max_length=200, null=True)
    city = models.CharField(max_length=200, null=True)
    state = models.CharField(max_length=200, null=True)
    zipcode = models.CharField(max_length=200, null=True)
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.address

class Contact(models.Model):
    name = models.CharField(max_length= 200)
    email = models.CharField(max_length= 100)
    phone = models.CharField(max_length = 20 , null = True, blank = False)
    address = models.CharField(max_length = 100, null = True, blank = False )

    def __str__(self):
        return self.name
