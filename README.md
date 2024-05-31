# CSE302 Project - Scholar Information Management System

A simple django project to demonstrate CRUD operations.

- University: East West University
- Course: CSE302 Database Systems

# Directory Structure
<details>
<summary><b>click here</b></summary>

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

</details>

# Setup

<details>
<summary><b>click here</b></summary>

> [!WARNING]  
> This setup assumes that you are using a Linux distribution.

## Clone and Installation
- Create a virtual environment in your preferred directory

    ```bash
    python -m venv django_project
    ```

- Activate the virtual environment

    ```bash
    source django_project
    ```

- Update `pip`

    ```bash
    python -m pip install --upgrade pip
    ```

- Clone this repo to your preferred directory

    ```bash
    git clone https://github.com/junnunkarim/EWU_CSE302_Scholar-Information-Management-System
    ```

- Change current directory to the cloned directory

    ```bash
    cd EWU_CSE302_Scholar-Information-Management-System
    ```

- Install necessary python libraries from the `requirements.txt`

    ```bash
    pip install -r requirements.txt
    ```

- Setup `mariadb`
    - Check if your Linux distribution has mariadb installed: [Distributions Which Include MariaDB](https://mariadb.com/kb/en/distributions-which-include-mariadb/)
    - If not, then setup it up using this guide: [Where to Download MariaDB](https://mariadb.com/kb/en/where-to-download-mariadb/)

## Setup Database
> [!IMPORTANT]  
> If you modify the name of the user, the password or the database, then you will also have to modify the relevant information of the `DATABASES` dictionary in `./django_src/
scholar_management/settings.py`

- Login to `mariadb`

    ```bash
    sudo mariadb -u root -p
    ```

- Create a database named `scholar_information`

    ```sql
    create database scholar_information character set UTF8;
    ```

- Create an user named `cse302_project` with password `1234`

    ```sql
    create user 'cse302_project'@'localhost' identified by '1234'
    ```

- Grant the user access to the database

    ```sql
    grant all privileges on scholar_information.* to 'cse302_project'@'localhost'
    ```

- exit `mariadb`
    
    ```bash
    exit
    ```

## Start Server
- Now change directory to `django_src`

    ```bash
    cd django_src/
    ```

- Start the django server

    ```bash
    python manage.py runserver
    ```

- Now you can visit the url `http://127.0.0.1:8000/` to see the server running

</details>

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
