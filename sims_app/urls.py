"""Defines URL patterns for sims_app"""

from django.urls import path
from . import views

app_name = 'sims_app'

urlpatterns = [
    # home page
    path('', views.index, name = 'index'),
    path('profile/', views.profile, name = 'profile'),
    path('registration/', views.registration, name = 'registration'),
]
