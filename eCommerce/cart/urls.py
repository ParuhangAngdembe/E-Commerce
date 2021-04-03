from django.contrib import admin
from django.urls import path , include

from .views import *

app_name = "home"
urlpatterns = [
    path("",HomeView.as_view() , name = 'home'),
    path("register/", registration, name='register'),
    path("login/", login, name='login'),
    path("productdetail/", productDetail, name="productdetail"),
]
