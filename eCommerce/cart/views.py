from django.shortcuts import render
from django.views.generic.base import View
from .models import *

# Create your views here.
# class BaseView(View):
#     views= {}
#
# class HomeView(BaseView):


# def base(request):
#         return render(request, 'base.html')

class BaseView(View):
        views={}

class HomeView(BaseView):
        def get(self,request):
                self.views['new_products'] = Product.objects.filter(label = 'new')[0:8]
                self.views['contact'] = Contact.objects.all()
                
                return render(request, 'index.html', self.views)
