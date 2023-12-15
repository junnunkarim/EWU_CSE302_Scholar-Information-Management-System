from django.shortcuts import render, redirect
from django.db import connection

import hashlib

from .models import *


# helper funcitons
def create_password_hash(password):
    return hashlib.sha256(str.encode(password)).hexdigest()


def save_to_session(
    request,
    first_name,
    last_name,
    contact_no,
    nationality,
    university,
    user_ID=None,
    username=None,
    email=None,
):
    if user_ID:
        request.session["user_ID"] = user_ID

    if username:
        request.session["username"] = username

    request.session["first_name"] = first_name
    request.session["last_name"] = last_name

    if email:
        request.session["email"] = email

    request.session["contact_no"] = contact_no
    request.session["nationality"] = nationality
    request.session["university"] = university


# Create your views here.
def registration(request):
    """Registration Page"""

    # redirect to the profile page if the user is already logged in
    if request.session.get("is_logged_in", False) and (not request.session.get("admin_logged_in", False)):
        return redirect("sims_app:profile")

    if request.method != "POST":
        not_post = "An error occured"
        parcel = {"not_post": not_post}

        return render(request, "sims_app/registration.html", parcel)
    else:
        username = request.POST["username"]
        first_name = request.POST["first_name"]
        last_name = request.POST["last_name"]
        password = request.POST["password"]
        confirm_password = request.POST["confirm_password"]
        email = request.POST["email"]
        contact_no = request.POST["contact_no"]
        nationality = request.POST["nationality"]
        university = request.POST["university"]

        # check if the user entered the same passwords
        if password != confirm_password:
            error_message = "Passwords do not match. Please enter matching passwords."
        else:
            with connection.cursor() as cursor:
                # check if the username is already taken
                query_username = "select username from user where username = %s;"
                # check if the email is already taken
                query_email = "select email from user where email = %s;"

                cursor.execute(query_username, [username])
                result_username = cursor.fetchall()

                cursor.execute(query_email, [email])
                result_email = cursor.fetchall()

            if result_username:
                error_message = "This username is already registered. Please use a different username."
            elif result_email:
                error_message = (
                    "This email is already registered. Please use a different email."
                )
            else:
                password_hash = create_password_hash(password)

                with connection.cursor() as cursor:
                    query_insert = """
                        insert into user
                        (user_ID, username, first_name, last_name, password, email, contact_no, nationality, university)
                        (
                            select coalesce(max(user_ID) + 1, 1), %s, %s, %s, %s, %s, %s, %s, %s
                            from user
                        );
                    """
                    cursor.execute(
                        query_insert,
                        [
                            username,
                            first_name,
                            last_name,
                            password_hash,
                            email,
                            contact_no,
                            nationality,
                            university,
                        ],
                    )

                # request.session['registration_success'] = True
                # if only 'login/' is used, it will be redirected to '<main_url>/registration/login/'
                # but if '/login/' is used, it will be redirected to '<main_url>/login/'
                # return redirect('/login/')

                if request.session['admin_logged_in']:
                    return redirect("sims_app:admin_edit_users")
                else:
                    return redirect("sims_app:login")

        # executes the lower section only if there are problems
        parcel = {"error_message": error_message}

        return render(request, "sims_app/registration.html", parcel)


def login(request):
    """Login Page"""

    # redirect to the profile page if the user is already logged in
    if request.session.get("is_logged_in", False):
        return redirect("sims_app:profile")

    if request.method != "POST":
        not_post = "An error occured"
        parcel = {"not_post": not_post}

        return render(request, "sims_app/login.html", parcel)
    else:
        username = request.POST.get("username", "")
        password = request.POST.get("password", "")

        password_hash = create_password_hash(password)

        # print(f'password: {password}')
        # print(f'password hash: {password_hash}')

        with connection.cursor() as cursor:
            query = "select * from user where username = %s and password = %s"

            cursor.execute(query, [username, password_hash])
            result_list = cursor.fetchall()

        # print(f'result_list: {result_list}')
        # print(f'result_list type: {type(result_list)}')

        if result_list:
            result = result_list[0]
            request.session["is_logged_in"] = True

            save_to_session(
                request=request,
                user_ID=result[0],
                username=result[1],
                first_name=result[2],
                last_name=result[3],
                email=result[5],
                contact_no=result[6],
                nationality=result[7],
                university=result[8],
            )

            return redirect("sims_app:profile")
        else:
            error_message = "Username or password is not correct! Please try again."
            parcel = {"error_message": error_message}

            return render(request, "sims_app/login.html", parcel)


def logout(request, url=None):
    # Clear all session data
    request.session.flush()

    if url == "admin":
        return redirect("sims_app:admin")
    elif url == "user":
        # redirect to login page
        return redirect("sims_app:login")
    else:
        # redirect to login page
        return redirect("sims_app:login")


def profile(request):
    """Personal Information Page"""

    if not request.session.get("is_logged_in", False):
        # redirect to the login page if the user is not logged in
        return redirect("sims_app:login")
    else:
        user_info = {
            "username": request.session.get("username"),
            "first_name": request.session.get("first_name"),
            "last_name": request.session.get("last_name"),
            "email": request.session.get("email"),
            "contact_no": request.session.get("contact_no"),
            "nationality": request.session.get("nationality"),
            "university": request.session.get("university"),
        }

        parcel = {"user_info": user_info}

    return render(request, "sims_app/profile.html", parcel)


def update_profile(request):
    """Page for Editing Personal Profile"""

    if not request.session.get("is_logged_in", False):
        # redirect to the login page if the user is not logged in
        return redirect("sims_app:login")

    if request.method != "POST":
        # get current logged-in username from session/cache
        username = request.session["username"]

        parcel = {"username": username}

        return render(request, "sims_app/update_profile.html", parcel)
    else:
        # get current logged-in username from session/cache
        username = request.session["username"]

        # get updated user information from form
        first_name = request.POST["first_name"]
        last_name = request.POST["last_name"]
        password = request.POST["password"]
        confirm_password = request.POST["confirm_password"]
        contact_no = request.POST["contact_no"]
        nationality = request.POST["nationality"]
        university = request.POST["university"]

        # check if the user entered the same passwords
        if password != confirm_password:
            error_message = "Passwords do not match. Please enter matching passwords."
        else:
            password_hash = create_password_hash(password)

            with connection.cursor() as cursor:
                query_update = """
                    update user
                    set
                        first_name = %s,
                        last_name = %s,
                        password = %s,
                        contact_no = %s,
                        nationality = %s,
                        university = %s
                    where username = %s;
                """

                cursor.execute(
                    query_update,
                    [
                        first_name,
                        last_name,
                        password_hash,
                        contact_no,
                        nationality,
                        university,
                        username,
                    ],
                )

            save_to_session(
                request=request,
                first_name=first_name,
                last_name=last_name,
                contact_no=contact_no,
                nationality=nationality,
                university=university,
            )

            # request.session['registration_success'] = True
            # if only 'login/' is used, it will be redirected to '<main_url>/registration/login/'
            # but if '/login/' is used, it will be redirected to '<main_url>/login/'
            # return redirect('/login/')
            return redirect("sims_app:profile")

    # executes the lower section only if there are problems
    parcel = {"error_message": error_message}

    return render(request, "sims_app/update_profile.html", parcel)


def paper_list(request):
    admin_logged_in = request.session.get("admin_logged_in", False)

    if (not request.session.get("is_logged_in", False)) and (not admin_logged_in):
        # redirect to the login page if the user is not logged in
        return redirect("sims_app:login")

    if not admin_logged_in:
        username = request.session["username"]

    with connection.cursor() as cursor:
        if admin_logged_in:
            query_list = "select * from paper"
            cursor.execute(query_list)
        else:
            query_list = """
                select paper_ID, title, publication_date, subject_name_id
                from user as u, authorship as a, paper as p
                where u.username = %s and
                    u.user_ID = a.user_ID_id and
                    p.paper_ID = a.paper_ID_id;
            """
            cursor.execute(query_list, [username])

        result_list = cursor.fetchall()

    if result_list:
        parcel = {"result_list": result_list}

        return render(request, "sims_app/paper_list.html", parcel)
    else:
        error_message = "User has no registered research paper."
        parcel = {"error_message": error_message}

        return render(request, "sims_app/paper_list.html", parcel)


def add_paper(request):
    admin_logged_in = request.session.get("admin_logged_in", False)

    if (not request.session.get("is_logged_in", False)) and (not admin_logged_in):
        # redirect to the login page if the user is not logged in
        return redirect("sims_app:login")


    if request.method != "POST":
        with connection.cursor() as cursor:
            query_get_subjects = "select name from subject"

            cursor.execute(query_get_subjects)
            result_list = cursor.fetchall()

            query_get_users = "select user_ID, first_name, last_name from user"

            cursor.execute(query_get_users)
            user_list = cursor.fetchall()

        if admin_logged_in:
            parcel = {"result_list": result_list, "user_list": user_list}
        else:
            parcel = {"result_list": result_list}

        return render(request, "sims_app/add_paper.html", parcel)
    else:
        if admin_logged_in:
            user_ID = request.POST["user_ID"]
        else:
            user_ID = request.session["user_ID"]

        title = request.POST["title"]
        publication_date = request.POST["publication_date"]
        subject_name_id = request.POST["subject_name_id"]

        print(f"publication_date: {publication_date}")

        with connection.cursor() as cursor:
            query_insert = """
                insert into paper
                (paper_ID, title, publication_date, subject_name_id)
                (
                    select coalesce(max(paper_ID) + 1, 1), %s, %s, %s
                    from paper
                );
            """

            query_paper_id = "select max(paper_ID) from paper"

            query_insert_authorship = """
                insert into authorship
                (user_ID_id, paper_ID_id)
                values
                (%s, %s)
            """

            # insert into `paper` table
            cursor.execute(
                query_insert,
                [
                    title,
                    publication_date,
                    subject_name_id,
                ],
            )

            # find the maximum id in `paper` table
            cursor.execute(query_paper_id)
            paper_ID = cursor.fetchone()[0]

            # create connection between `user` and `paper` tables
            cursor.execute(query_insert_authorship, [user_ID, paper_ID])

        return redirect("sims_app:paper_list")


def delete_paper(request):
    admin_logged_in = request.session.get("admin_logged_in", False)

    if (not request.session.get("is_logged_in", False)) and (not admin_logged_in):
        # redirect to the admin login page if admin is not logged in
        return redirect("sims_app:login")
    else:
        if request.method != "POST":
            not_post = "An error occured"
            parcel = {"not_post": not_post}

            return render(request, "sims_app/delete_paper.html", parcel)
        else:
            paper_ID = request.POST["paper_ID"]

            with connection.cursor() as cursor:
                query_delete_authorship = """
                    delete from authorship
                    where paper_ID_id = %s
                """
                query_delete_paper = """
                    delete from paper
                    where paper_ID = %s
                """

                cursor.execute(query_delete_authorship, paper_ID)
                cursor.execute(query_delete_paper, paper_ID)

                return redirect("sims_app:paper_list")


def admin_delete_users(request):
    if not request.session.get("admin_logged_in", False):
        # redirect to the admin login page if admin is not logged in
        return redirect("sims_app:admin")
    else:
        if request.method != "POST":
            not_post = "An error occured"
            parcel = {"not_post": not_post}

            return render(request, "sims_app/admin_delete_users.html", parcel)
        else:
            user_ID = request.POST["user_ID"]

            with connection.cursor() as cursor:
                query_delete_authorship = """
                    delete from authorship
                    where user_ID_id = %s
                """
                query_delete_user = """
                    delete from user
                    where user_ID = %s
                """

                cursor.execute(query_delete_authorship, user_ID)
                cursor.execute(query_delete_user, user_ID)

            return redirect("sims_app:admin_edit_users")




def admin(request):
    """The Admin Page"""

    if request.method != "POST":
        not_post = "An error occured"
        parcel = {"not_post": not_post}

        return render(request, "sims_app/admin.html", parcel)
    else:
        username = request.POST.get("username")
        password = request.POST.get("password")

        # password_hash = create_password_hash(password)

        # print(f'password: {password}')
        # print(f'password hash: {password_hash}')

        with connection.cursor() as cursor:
            query = "select * from admin where username = %s and password = %s"

            cursor.execute(query, [username, password])
            result_list = cursor.fetchall()

        if result_list:
            request.session["admin_logged_in"] = True

            return redirect("sims_app:admin_user_list")
        else:
            error_message = "Username or password is not correct! Please try again."
            parcel = {"error_message": error_message}

            return render(request, "sims_app/admin.html", parcel)


def admin_user_list(request):
    if not request.session.get("admin_logged_in", False):
        # redirect to the admin login page if admin is not logged in
        return redirect("sims_app:admin")
    else:
        with connection.cursor() as cursor:
            query_user_list = "select * from user;"

            cursor.execute(query_user_list)
            result_list = cursor.fetchall()

        parcel = {"result_list": result_list}

        return render(request, 'sims_app/admin_user_list.html', parcel)
