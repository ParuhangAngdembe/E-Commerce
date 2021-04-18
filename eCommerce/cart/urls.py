from django.contrib import admin
from django.urls import path , include


from .views import *

app_name = "home"
urlpatterns = [
    path("",HomeView.as_view() , name = 'home'),
    path("product/<slug>", ProductDetailView.as_view(), name='product'),

# testig
    path("main/", main, name='main'),
    path("createproduct/", createProduct, name='createproduct'),
    path("updateproduct/<slug>/", updateProduct, name='updateproduct'),
    path("deleteproduct/<slug>/", deleteProduct, name='deleteproduct'),
    
    path("createcategory/", createCategory, name='createcategory'),
    path("updatecategory/<slug>/", updateCategory, name='updatecategory'),
    path("deletecategory/<slug>/", deleteCategory, name='deletecategory'),

    path("register/", registration, name='register'),
    path("login/", login, name='login'),


    
    path("cart/", cart, name='cart'),
    path("updateitem/", updateItem, name='updateitem'),
    path("checkout/", checkout, name='checkout'),
]
 