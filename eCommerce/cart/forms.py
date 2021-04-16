from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import User
from django import forms
from .models import *

class CreateUserForm(UserCreationForm):
    username= forms.CharField(widget= forms.TextInput
                           (attrs={'placeholder':'Enter your Username'}))
    email= forms.CharField(widget= forms.EmailInput
                            (attrs={'placeholder':'Enter your Email'}))
    password1= forms.CharField(widget= forms.TextInput
                            (attrs={'placeholder':'Password'}))
    password2= forms.CharField(widget= forms.TextInput
                            (attrs={'placeholder':'Confirm Password'}))

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']


class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = '__all__'

class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = '__all__'
