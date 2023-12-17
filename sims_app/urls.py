"""Defines URL patterns for sims_app"""

from django.urls import path

from . import views

app_name = "sims_app"

urlpatterns = [
    # home page
    path("", views.login, name="login"),
    # user/admin login/logout related
    path("login/", views.login, name="login"),
    path("logout/", views.logout, name="logout"),
    # user/profile related
    path("registration/", views.registration, name="registration"),
    path("profile/", views.profile, name="profile"),
    path("edit_profile_helper/", views.edit_profile_helper, name="edit_profile_helper"),
    path("edit_profile/", views.edit_profile, name="edit_profile"),
    path("user_list/", views.user_list, name="user_list"),
    path("delete_user/", views.delete_user, name="delete_user"),
    # paper related
    path("add_paper/", views.add_paper, name="add_paper"),
    path("edit_paper_helper/", views.edit_paper_helper, name="edit_paper_helper"),
    path("edit_paper/", views.edit_paper, name="edit_paper"),
    path("paper_list/", views.paper_list, name="paper_list"),
    path("delete_paper/", views.delete_paper, name="delete_paper"),
    # subject related
    path("add_subject/", views.add_subject, name="add_subject"),
    path("subject_list/", views.subject_list, name="subject_list"),
    path("delete_subject/", views.delete_subject, name="delete_subject"),
]
