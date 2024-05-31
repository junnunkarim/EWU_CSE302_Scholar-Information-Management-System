from django.contrib import admin

from .models import *
# Register your models here.

admin.site.register(Admin)
admin.site.register(Subject)
admin.site.register(Paper)
admin.site.register(User)
admin.site.register(Authorship)
