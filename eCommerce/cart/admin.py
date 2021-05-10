from django.contrib import admin

# Register your models here.
from cart.models import *

admin.site.register(Product)
admin.site.register(Category)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(Customer)
admin.site.register(ShippingAddress)

admin.site.register(Contact)
admin.site.register(ContactUs)