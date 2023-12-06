from django.db import models

# Create your models here.

class admin(models.Model):
    username = models.CharField(max_length = 20, primary_key = True)
    password = models.CharField(max_length = 100, blank = False, null = False)

    def __str__(self):
        return self.username

    class Meta:
        db_table = 'admin'
