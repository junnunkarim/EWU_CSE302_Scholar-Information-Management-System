from django.db import models

# Create your models here.

class admin(models.Model):
    username = models.CharField(max_length = 20, primary_key = True)
    password = models.CharField(max_length = 100, blank = False, null = False)

    def __str__(self):
        return self.username

    class Meta:
        db_table = 'admin'

class subject(models.Model):
    name = models.CharField(max_length = 20, primary_key = True)
    data_added = models.DateTimeField(auto_now_add = True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'subject'

class paper(models.Model):
    subject_name = models.ForeignKey(subject, on_delete = models.CASCADE)
    title = models.CharField(max_length = 70, blank = False, null = False)
    publication_date = models.DateTimeField(auto_now_add = True)

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'paper'

class user(models.Model):
    username = models.CharField(max_length = 20, primary_key = True)
    first_name = models.CharField(max_length = 20, blank = False, null = False)
    last_name = models.CharField(max_length = 20)
    password = models.CharField(max_length = 100, blank = False, null = False)
    email = models.CharField(max_length = 100, blank = False, null = False)
    contact_no = models.CharField(max_length = 20, blank = False, null = False)
    nationality = models.CharField(max_length = 20, blank = False, null = False)
    university = models.CharField(max_length = 50, blank = False, null = False)

    def __str__(self):
        return self.username

    class Meta:
        db_table = 'user'

class authorship(models.Model):
    user_ID = models.ForeignKey(user, on_delete = models.CASCADE)
    paper_ID = models.ForeignKey(paper, on_delete = models.CASCADE)
    def __str__(self):
        return self.user_ID

    class Meta:
        db_table = 'authorship'
