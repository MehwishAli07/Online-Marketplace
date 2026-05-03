from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('seller/', views.seller_page, name='seller'),
]



