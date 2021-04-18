from django.shortcuts import render, redirect
from django.views.generic.base import View
from django.contrib.auth.forms import UserCreationForm
from pip._vendor.requests import post
from django.http import JsonResponse
import json

from .forms import *
from .models import *

# Create your views here.
# class BaseView(View):
#     views= {}
#
# class HomeView(BaseView):



class BaseView(View):
        views={}

class HomeView(BaseView):
        def get(self,request):
                self.views['new_products'] = Product.objects.filter(label = 'New Product')[0:8]
                self.views['contact'] = Contact.objects.all()
                self.views['categories'] = Category.objects.all()

                return render(request, 'index.html', self.views)

class ProductDetailView(BaseView):
        def get(self, request, slug):
                self.views['product_detail'] = Product.objects.filter(slug = slug)

                return render(request, 'productdetail.html', self.views)


#---------------------------------------------------------------------------Admin Dashboard
def main(request):
        ttl_prd = Product.objects.all()	
        ttl_cat = Category.objects.all()
        context = {
                'ttl_prd':ttl_prd,
                'ttl_cat':ttl_cat,
        }
        return render(request, 'admindash.html', context)

def createProduct(request):
        if request.method == "POST":
                form = ProductForm(request.POST)
                if form.is_valid():
                        form.save()
                        return redirect('/createproduct')
        context = {
                'form': ProductForm,
        }
        return render(request, 'createproduct.html', context)

def updateProduct(request, slug):
        data = Product.objects.get(slug=slug)
        form = ProductForm(instance = data)

        if request.method == 'POST':
                form = ProductForm(request.POST, instance = data)
                if form.is_valid():
                        form.save()
                        return redirect('/main')

        context = {
                'form': form,
        }

        return render(request, 'createproduct.html', context)

def deleteProduct(request, slug):
        data = Product.objects.get(slug=slug)
        if request.method == "POST":
                data.delete()
                return redirect('/main')
        
        context = {
                'product':data ,
        }

        return render(request, 'deleteproduct.html', context)


# ---------------------------------------------------------------------------CATEGORY CRUD

def createCategory(request):
        if request.method == "POST":
                catform = CategoryForm(request.POST)
                if catform.is_valid():
                        catform.save()
                        return redirect('/main')
        context = {
                'catform' : CategoryForm,
        }
        return render (request, 'createcategory.html', context)

def updateCategory(request, slug):
        catdata = Category.objects.get(slug=slug)
        catform = CategoryForm(instance = catdata)

        if request.method == 'POST':
                catform = CategoryForm(request.POST, instance = catdata)
                if catform.is_valid():
                        catform.save()
                        return redirect('/main')

        context = {
                'catform': catform,
        }

        return render(request, 'createcategory.html', context)

def deleteCategory(request, slug):
        catdata = Category.objects.get(slug=slug)
        if request.method == "POST":
                catdata.delete()
                return redirect('/main')
        
        context = {
                'category':catdata ,
        }

        return render(request, 'deletecategory.html', context)

# ---------------------------------------------------------------------------LOGIN CRUD

def registration(request):
        # form = CreateUserForm()
        # if request.method == "POST":
        #         form = CreateUserForm(request.POST)
        #         if form.is_valid():
        #                 form.save()

        # context = {
        #         'form': form,
               
        # }

        return render(request, 'registration.html')

def login(request):
        return render(request, 'login.html')

#--------------------------------------------------------------------------------CART

def cart(request):
        if request.user.is_authenticated:
                customer = request.user.customer
                order, created = Order.objects.get_or_create(customer= customer)
                items = order.orderitem_set.all()
        else:
                items = []
                order = {'get_cart_total':0, 'get_cart_items':0}

        context= {'items':items,'order':order,}
        return render(request, 'cart.html', context)

def updateItem(request):
        data = json.loads(request.body)
        productId = data['productId']
        action = data['action']
        print('productId:', productId)
        print('action:', action)

        customer = request.user.customer
        product = Product.objects.get(id=productId)
        order, created = Order.objects.get_or_create(customer=customer)
        orderItem, created = OrderItem.objects.get_or_create(order= order, product= product)

        if action == 'add':
                orderItem.quantity = (orderItem.quantity+1)
        elif action == 'remove':
                orderItem.quantity = (orderItem.quantity - 1)
        
        orderItem.save()

        if orderItem.quantity <= 0:
                orderItem.delete()

        return JsonResponse('Item was added', safe=False)


def checkout(request):
        return render(request, 'checkout.html')