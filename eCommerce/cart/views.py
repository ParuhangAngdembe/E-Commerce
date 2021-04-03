from django.shortcuts import render
from django.views.generic.base import View
from django.contrib.auth.forms import UserCreationForm

from .forms import CreateUserForm
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


def registration(request):
        form = CreateUserForm()
        if request.method == "POST":
                form = CreateUserForm(request.POST)
                if form.is_valid():
                        form.save()

        context = {
                'form': form,
               
        }

        return render(request, 'registration.html', context)

def login(request):
        return render(request, 'login.html')



