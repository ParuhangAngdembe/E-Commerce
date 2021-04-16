from django.shortcuts import render, redirect
from django.views.generic.base import View
from django.contrib.auth.forms import UserCreationForm
from pip._vendor.requests import post

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
                self.views['new_products'] = Product.objects.filter(label = 'new')[0:8]
                self.views['contact'] = Contact.objects.all()
                self.views['categories'] = Category.objects.all()

                return render(request, 'index.html', self.views)

class ProductDetailView(BaseView):
        def get(self, request, slug):
                self.views['product_detail'] = Product.objects.filter(slug = slug)

                return render(request, 'productdetail.html', self.views)



#LOGIN CRUD

# def registration(request):
#         form = CreateUserForm()
#         if request.method == "POST":
#                 form = CreateUserForm(request.POST)
#                 if form.is_valid():
#                         form.save()

#         context = {
#                 'form': form,
               
#         }

#         return render(request, 'registration.html', context)

# def login(request):
#         return render(request, 'login.html')


# Dashboard
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



# CATEGORY CRUD

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
