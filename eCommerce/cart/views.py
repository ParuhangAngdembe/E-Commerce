from django.shortcuts import render, redirect
from django.views.generic.base import View

from pip._vendor.requests import post
from django.http import JsonResponse
import json

from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required

from .forms import *
from .models import *
from .decorators import *


class BaseView(View):
    views = {}


class HomeView(BaseView):
    def get(self, request):
        self.views['new_products'] = Product.objects.filter(label="New Product")[
            0:8]
        self.views['sale'] = Product.objects.filter(
            label="Sale Product")[0:3]
        # self.views['contact'] = Contact.objects.all()
        self.views['categories'] = Category.objects.all()

        return render(request, 'index.html', self.views)


class ProductDetailView(BaseView):
    def get(self, request, slug):
        self.views['product_detail'] = Product.objects.filter(
            slug=slug)

        return render(request, 'productdetail.html', self.views)


def allProducts(request):
    allproduct = Product.objects.all()
    context = {
        'allproduct': allproduct,
    }
    return render(request, 'allproduct.html', context)
# ---------------------------------------------------------------------------Admin Dashboard


@login_required(login_url='/login')
@allowed_users(allowed_roles=['admin', ])
def main(request):
    ttl_prd = Product.objects.all()
    ttl_cat = Category.objects.all()

    messages = ContactUs.objects.all()[0:3]
    context = {
        'ttl_prd': ttl_prd,
        'ttl_cat': ttl_cat,
        'messages': messages,      
    }
    return render(request, 'admindash.html', context)


@login_required(login_url='/login')
def createProduct(request):
    form = ProductForm()
    if request.method == "POST":
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/main')
    context = {
        'form': ProductForm,
    }
    return render(request, 'createproduct.html', context)


@login_required(login_url='/login')
def updateProduct(request, slug):
    data = Product.objects.get(slug=slug)
    form = ProductForm(instance=data)

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=data)
        if form.is_valid():
            form.save()
            return redirect('/main')

    context = {
        'form': form,
    }

    return render(request, 'createproduct.html', context)


@login_required(login_url='/login')
def deleteProduct(request, slug):
    data = Product.objects.get(slug=slug)
    if request.method == "POST":
        data.delete()
        return redirect('/main')

    context = {
        'product': data,
    }

    return render(request, 'deleteproduct.html', context)

def allMessages(request):
    allmsg = ContactUs.objects.all()
    context = {
        'messages': allmsg,
    }
    return render(request, 'allmsg.html', context)

# ---------------------------------------------------------------------------CATEGORY CRUD
@login_required(login_url='/login')
def createCategory(request):
    if request.method == "POST":
        catform = CategoryForm(request.POST)
        if catform.is_valid():
            catform.save()
            return redirect('/main')
    context = {
        'catform': CategoryForm,
    }
    return render(request, 'createcategory.html', context)


@login_required(login_url='/login')
def updateCategory(request, slug):
    catdata = Category.objects.get(slug=slug)
    catform = CategoryForm(instance=catdata)

    if request.method == 'POST':
        catform = CategoryForm(request.POST, instance=catdata)
        if catform.is_valid():
            catform.save()
            return redirect('/main')

    context = {
        'catform': catform,
    }

    return render(request, 'createcategory.html', context)


@login_required(login_url='/login')
def deleteCategory(request, slug):
    catdata = Category.objects.get(slug=slug)
    if request.method == "POST":
        catdata.delete()
        return redirect('/main')

    context = {
        'category': catdata,
    }

    return render(request, 'deletecategory.html', context)

# --------------------------------------------------------------------------------CART


@login_required(login_url='/login')
def cart(request):
    if request.user.is_authenticated:
        # customer = request.user.customer
        customer = request.user
        # order, created = Order.objects.get_or_create(customer=customer)
        orders = Order.objects.filter(customer=customer)
        items = []
        total = 0
        cart_items = 0
        for order in orders:
            itemlist = OrderItem.objects.filter(order=order)
            for item in itemlist:
                total = total + item.product.price * item.quantity
                cart_items = cart_items + 1
                items.append(item)
        # items = OrderItem.objects.filter(order=order)
        print(orders)
        print(items)
        order = {'get_cart_total': total, 'get_cart_items': cart_items}
        context = {'items': items, 'order': order, }
        return render(request, 'cart.html', context)
    else:
        items = []
        order = {'get_cart_total': 0, 'get_cart_items': 0}
        context = {'items': items, 'order': order, }
        return render(request, 'cart.html', context)

    


@login_required(login_url='/login')
def updateItem(request):
    data = json.loads(request.body)
    productId = data['productId']
    action = data['action']
    print('productId:', productId)
    print('action:', action)

    customer = request.user
    product = Product.objects.get(id=productId)
    order, created = Order.objects.get_or_create(customer=customer)
    orderItem, created = OrderItem.objects.get_or_create(
        order=order, product=product)

    if action == 'add':
        orderItem.quantity = (orderItem.quantity+1)
    elif action == 'remove':
        orderItem.quantity = (orderItem.quantity - 1)

    orderItem.save()

    if orderItem.quantity <= 0:
        orderItem.delete()

    return JsonResponse('Item was added', safe=False)


@login_required(login_url='/login')
def checkout(request):
    return render(request, 'checkout.html')
# ---------------------------------------------------------------------------LOGIN CRUD


@unauthenticated_user
def registerUser(request):
    form = CreateUserForm()
    if request.method == "POST":
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')
            customer = Customer(user=user, username=username, email=user.email)

            messages.success(request, 'Account Was Created For ' + username)
            return redirect('/login')

    context = {'form': form}

    return render(request, 'registration.html', context)


@unauthenticated_user
def loginUser(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('/')
        else:
            messages.info(request, 'Username or Password Is Incorrect')

    context = {}
    return render(request, 'login.html', context)


def logoutUser(request):
    logout(request)
    return redirect('/')

# -------------------------------------------------------------Contact page-----------

def contact(request):
    context = {}
    if request.method == "POST":
        # yo request vaneko chai Form ma vako input tag ko name
        name = request.POST['name']
        email = request.POST['email']
        subject = request.POST['subject']
        message = request.POST['message']

        data =ContactUs.objects.create(
        # models' field name = vairable
            name = name,
            email = email,
            subject = subject,
            message = message
        )
        data.save()
        context['success']="Your Message Was Sent"

   
    context['contact']=Contact.objects.all()
    # yo objects vanna khojeko, database ko 'row'

    return render(request,'contact.html', context)

#---------------------------------------------------------------Empty Page
def emptyLink(request):
    return render(request, 'empty.html')