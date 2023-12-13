"""Defines URL patterns for sims_app"""

from django.urls import path
from . import views

app_name = 'sims_app'

urlpatterns = [
    # home page
    path('', views.login, name = 'login'),
    path('registration/', views.registration, name = 'registration'),
    path('login/', views.login, name = 'login'),
    path('logout/', views.logout, name = 'logout'),
    path('profile/', views.profile, name = 'profile'),
    path('update_profile/', views.update_profile, name = 'update_profile'),

    path('admin/', views.admin, name = 'admin'),
    path('admin_user_panel/', views.admin, name = 'admin'),
    path('admin_paper_panel/', views.admin, name = 'admin'),
    path('admin_subject_panel/', views.admin, name = 'admin'),
]
