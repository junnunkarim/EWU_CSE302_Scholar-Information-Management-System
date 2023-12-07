from django.shortcuts import render, redirect
from django.db import connection

import hashlib

from .models import *

# helper funcitons
def create_password_hash(password):
    return hashlib.sha256(str.encode(password)).hexdigest()

# Create your views here.

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
                password_hash = create_password_hash(password)

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

                # request.session['registration_success'] = True
                # if only 'login/' is used, it will be redirected to '<main_url>/registration/login/'
                # but if '/login/' is used, it will be redirected to '<main_url>/login/'
                # return redirect('/login/')
                return redirect('sims_app:login')

        # executes the lower section only if there are problems
        parcel = {'error_message': error_message}

        return render(request, 'sims_app/registration.html', parcel)

def login(request):
    """Login Page"""

    # redirect to the profile page if the user is logged in
    if request.session.get('is_logged_in', False):
        return redirect('sims_app:profile')

    if request.method != 'POST':
        not_post = 'An error occured'
        parcel = {'not_post': not_post}

        return render(request, 'sims_app/login.html', parcel)
    else:
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')

        password_hash = create_password_hash(password)

        # print(f'password: {password}')
        # print(f'password hash: {password_hash}')

        with connection.cursor() as cursor:
            query = 'select * from user where username = %s and password = %s'

            cursor.execute(query, [username, password_hash])
            result_list = cursor.fetchall()

        # print(f'result_list: {result_list}')
        # print(f'result_list type: {type(result_list)}')

        if result_list:
            result = result_list[0]
            request.session['is_logged_in'] = True
            request.session['username'] = result[1]
            request.session['first_name'] = result[2]
            request.session['last_name'] = result[3]
            request.session['email'] = result[5]
            request.session['contact_no'] = result[6]
            request.session['nationality'] = result[7]
            request.session['university'] = result[8]

            return redirect('sims_app:profile')
        else:
            error_message = 'Username or password is not correct! Please try again.'
            parcel = {'error_message': error_message}

            return render(request, 'sims_app/login.html', parcel)

def logout(request):
    # Clear all session data
    request.session.flush()

    # redirect to login page
    return redirect('sims_app:login')

def profile(request):
    """Personal Information Page"""

    if not request.session.get('is_logged_in', False):
        # redirect to the login page if the user is not logged in
        return redirect('sims_app:login')
    else:
        user_info = {
            'username' : request.session.get('username'),
            'first_name' : request.session.get('first_name'),
            'last_name' : request.session.get('last_name'),
            'email' : request.session.get('email'),
            'contact_no' : request.session.get('contact_no'),
            'nationality' : request.session.get('nationality'),
            'university' : request.session.get('university'),
        }

        parcel = {'user_info': user_info}

    return render(request, 'sims_app/profile.html', parcel)
