"""Defines URL patterns for sims_app"""

from django.urls import path
from . import views

app_name = 'sims_app'

urlpatterns = [
    # home page
    path('', views.login, name = 'login'),
    path('registration/', views.registration, name = 'registration'),
    path('login/', views.login, name = 'login'),
    path('logout/<str:url>/', views.logout, name = 'logout'),
    path('profile/', views.profile, name = 'profile'),
    path('update_profile/', views.update_profile, name = 'update_profile'),
    path('paper_list/', views.paper_list, name = 'paper_list'),
    path('add_paper/', views.add_paper, name = 'add_paper'),

    path('admin/', views.admin, name = 'admin'),
    path('admin_edit_users/', views.admin_edit_users, name = 'admin_edit_users'),
    path('admin_paper_panel/', views.admin, name = 'admin'),
    path('admin_subject_panel/', views.admin, name = 'admin'),

]
