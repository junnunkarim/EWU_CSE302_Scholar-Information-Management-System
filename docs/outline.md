# Scholar Information Management System

## Features
- registration page
- login page
    - admin
        - add user
        - update user
        - delete user
    - user
        - profile page
            - update profile
            - research paper list
                - add new research paper
                    - add research paper page
                - update
                - delete
            - subject list page
                - specific subject page
            - logout

## Database Scheme
```
    Table admin {
      id int [pk]
      username varchar(20) [not null, unique]
      password varchar(100)  [not null, unique]
    }

    Table subject {
      id int [pk]
      name varchar(20) [not null, unique]
      date_added datetitme
    }

    Table paper {
      id int [pk]
      title varchar(70) [not null, unique]
      subject_name varchar(20) [ref: > subject.name]
      publication_date datetime
    }

    Table user {
      id integer [pk]
      username varchar(20) [not null, unique]
      first_name varchar(20) [not null]
      last_name varchar(20)
      password varchar(100) [not null]
      email varchar(100) [not null, unique]
      contact_no varchar(20) [not null]
      nationality varchar(20) [not null]
      university varchar(50) [not null]
    }

    Table authorship {
      user_ID interger
      paper_ID integer
    }

    Ref: authorship.user_ID > user.id
    Ref: authorship.paper_ID > paper.id
```
