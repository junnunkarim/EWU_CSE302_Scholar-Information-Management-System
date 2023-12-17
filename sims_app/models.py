from django.db import models

# Create your models here.


class Admin(models.Model):
    username = models.CharField(max_length=20, blank=False, null=False, unique=True)
    password = models.CharField(max_length=100, blank=False, null=False)

    def __str__(self):
        return self.username

    class Meta:
        db_table = "admin"


class Subject(models.Model):
    subject_ID = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=20, blank=False, null=False, unique=True)
    date_added = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "subject"


class Paper(models.Model):
    paper_ID = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=255, blank=False, null=False, unique=True)
    subject_name = models.ForeignKey(Subject, to_field="name", on_delete=models.CASCADE)
    publication_date = models.DateField()

    def __str__(self):
        return self.title

    class Meta:
        db_table = "paper"


class User(models.Model):
    user_ID = models.IntegerField(primary_key=True)
    username = models.CharField(max_length=20, blank=False, null=False, unique=True)
    first_name = models.CharField(max_length=20, blank=False, null=False)
    last_name = models.CharField(max_length=20, null=True)
    password = models.CharField(max_length=100, blank=False, null=False)
    email = models.CharField(max_length=100, blank=False, null=False, unique=True)
    contact_no = models.CharField(max_length=20, blank=False, null=False)
    nationality = models.CharField(max_length=20, blank=False, null=False)
    university = models.CharField(max_length=50, blank=False, null=False)

    def __str__(self):
        return self.username

    class Meta:
        db_table = "user"


class Authorship(models.Model):
    paper_ID = models.ForeignKey(Paper, on_delete=models.CASCADE)
    user_ID = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.user_ID

    class Meta:
        db_table = "authorship"
