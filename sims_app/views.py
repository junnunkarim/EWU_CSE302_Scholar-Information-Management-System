from django.shortcuts import render
from django.db import connection

from .models import *

# Create your views here.

def index(request):
    """The Home Page"""

    return render(request, 'sims_app/index.html')

def personal(request):
    """The Personal Page."""
    with connection.cursor() as cursor:
        sql = 'select * from user where id = 1;'

        cursor.execute(sql)
        results = cursor.fetchall()
        print(results)

    context = {'results' : results}

    return render(request, 'sims_app/personal.html', context)
