from django.shortcuts import render
from django.views.generic.base import View
# Create your views here.
# class BaseView(View):
#     views= {}
#
# class HomeView(BaseView):
def home(request):
        return render (request, 'index.html')

def base(request):
        return render(request, 'base.html')