from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from decimal import Decimal
from .models import Product, Cart, CartItem, Order, OrderItem, UserProfile

# Create your views here.

#basic pages

#home page
def home(request):
    return render(request, 'index.html')

@login_required
# Seller update
def seller_page(request):
    profile, created = UserProfile.objects.get_or_create(user=request.user)

    # HANDLE POST REQUESTS
    if request.method == "POST":

        # Become Seller
        if "become_seller" in request.POST:
            profile.isSeller = True
            profile.save()
            return redirect("seller")

        # Add Product (only if already a seller)
        if profile.isSeller:
            name = request.POST.get("name")
            description = request.POST.get("description")
            price = request.POST.get("price","0")
            productimg = request.FILES.get("image")

            Product.objects.create(
                name=name,
                description=description,
                price=Decimal(price),
                productimg=productimg,
                seller=profile
            )

            return redirect("seller")

    # GET request → show products
    products = Product.objects.filter(seller=profile)

    return render(request, "seller.html", {
        "products": products,
        "profile": profile
    })

