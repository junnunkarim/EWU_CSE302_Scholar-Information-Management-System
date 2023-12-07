from django.shortcuts import render, redirect
from django.db import connection
from django.contrib.auth.hashers import make_password, check_password

from .models import *

# Create your views here.

def index(request):
    """The Home Page"""

    return render(request, 'sims_app/index.html')

def profile(request):
    """Personal Information Page"""

    with connection.cursor() as cursor:
        user_info_query = 'select * from user where id = 1;'

        cursor.execute(user_info_query)
        results = cursor.fetchall()
        print(results)

    parcel = {'results' : results}

    return render(request, 'sims_app/profile.html', parcel)

def registration(request):
    """Registration Page"""

    if request.method != 'POST':
        not_post = 'An error occured'
        parcel = {'not_post': not_post}

        return render(request, 'sims_app/registration.html', parcel)
    else:
        username = request.POST['username']
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']
        email = request.POST['email']
        contact_no = request.POST['contact_no']
        nationality = request.POST['nationality']
        university = request.POST['university']

        # check if the user entered the same passwords
        if password != confirm_password:
            error_message = 'Passwords do not match. Please enter matching passwords.'
        else:
            with connection.cursor() as cursor:
                # check if the username is already taken
                query_username = 'select username from user where username = %s;'
                # check if the email is already taken
                query_email = 'select email from user where email = %s;'

                cursor.execute(query_username, [username])
                result_username = cursor.fetchall()

                cursor.execute(query_email, [email])
                result_email = cursor.fetchall()

            if result_username:
                error_message = 'This username is already registered. Please use a different username.'
            elif result_email:
                error_message = 'This email is already registered. Please use a different email.'
            else:
                password_hash = make_password(password)

                with connection.cursor() as cursor:
                    query_insert = '''
                    insert into user
                    (id, username, first_name, last_name, password, email, contact_no, nationality, university)
                    (
                        select coalesce(max(id) + 1, 1), %s, %s, %s, %s, %s, %s, %s, %s
                        from user
                    );
                    '''

                    cursor.execute(query_insert, [username, first_name, last_name, password_hash, email, contact_no, nationality, university])

                return redirect('/login', username = username)

        # executes the lower section only if there are problems
        parcel = {'error_message': error_message}

        return render(request, 'sims_app/registration.html', parcel)
