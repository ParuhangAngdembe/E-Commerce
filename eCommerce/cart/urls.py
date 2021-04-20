from django.contrib import admin
from django.urls import path , include

from django.conf import settings
from django.conf.urls.static import static

from .views import *

app_name = "home"
urlpatterns = [
    path("",HomeView.as_view() , name = 'home'),
    path("product/<slug>", ProductDetailView.as_view(), name='product'),

    path("main/", main, name='main'),
    path("createproduct/", createProduct, name='createproduct'),
    path("products/", allProducts, name='products'),
    path("updateproduct/<slug>/", updateProduct, name='updateproduct'),
    path("deleteproduct/<slug>/", deleteProduct, name='deleteproduct'),
    
    path("createcategory/", createCategory, name='createcategory'),
    path("updatecategory/<slug>/", updateCategory, name='updatecategory'),
    path("deletecategory/<slug>/", deleteCategory, name='deletecategory'),

    path("cart/", cart, name='cart'),
    path("updateitem/", updateItem, name='updateitem'),
    path("checkout/", checkout, name='checkout'),

    path("register/", registerUser, name='register'),
    path("login/", loginUser, name='login'),
    path("logout/", logoutUser, name='logout'),

     path("contact/", contact, name='contact'),
    
]
 