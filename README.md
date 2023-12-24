# CSE302 Project - Scholar Information Management System

A simple django project to demonstrate CRUD operations.

- University: East West University
- Course: CSE302 Database Systems

# Directory Structure

```
├── README.md
├── data
│   └── scholar_information_database.sql
├── docs
│   ├── CSE302_project-report_group-02.docx
│   ├── CSE302_project-report_group-02.pdf
│   └── outline.md
├── manage.py
├── scholar_management
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
└── sims_app
    ├── __init__.py
    ├── admin.py
    ├── apps.py
    ├── migrations
    │   ├── 0001_initial.py
    │   └── __init__.py
    ├── models.py
    ├── static
    │   ├── bootstrap-icons
    │   │   ├── font
    │   ├── css
    │   ├── icons
    │   └── js
    ├── templates
    │   └── sims_app
    │       ├── add_paper.html
    │       ├── add_subject.html
    │       ├── admin.html
    │       ├── base.html
    │       ├── base_admin.html
    │       ├── base_sensitive.html
    │       ├── edit_paper.html
    │       ├── edit_profile.html
    │       ├── login.html
    │       ├── paper_list.html
    │       ├── profile.html
    │       ├── registration.html
    │       ├── subject_list.html
    │       └── user_list.html
    ├── templatetags
    │   ├── __init__.py
    │   └── navbar_tags.py
    ├── tests.py
    ├── tests.py
    ├── urls.py
    └── views.py
```

# E-R Diagram

![img](/ss/cse302_project_schema.png)

# ScreenShots

<details>
<summary><b>click here</b></summary>

### Login Page

![img](/ss/1_login.png)

### Registration Page

![img](/ss/1_registration.png)

### User Profile Page

![img](/ss/2_user_profile.png)

### Edit User Information (User) Page

![img](/ss/3_user_edit_profile.png)

### Paper List (User) Page

![img](/ss/4_user_paper_list.png)

### Add Paper (User) Page

![img](/ss/5_user_add_paper.png)

### User List (Admin) Page

![img](/ss/7_admin_user_list.png)

### Edit User Information (Admin) Page

![img](/ss/8_admin_edit_user.png)

### Paper List (Admin) Page

![img](/ss/9_admin_paper_list.png)

### Edit Paper Information (Admin) Page

![img](/ss/10_admin_edit_paper.png)

### Subject List (Admin) Page

![img](/ss/11_admin_subject_list.png)

### Add Subject (Admin) Page

![img](/ss/12_admin_add_subject.png)

</details>

# Credit

- [Junnun Mohamed Karim](https://www.github.com/junnunkarim)
- [Md. Yousuf Hozaifa](https://www.github.com/Yousuf-Hozaifa)
