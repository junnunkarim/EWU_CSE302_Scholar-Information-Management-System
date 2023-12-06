# Scholar Information Management System

## Features
- registration page
- login page
    - admin
        - add user
        - update user
        - delete user
    - user
        - personal information page
            - modify personal information
            - research paper list
                - add new research paper
                    - add research paper page
                - update
                - delete
            - subject list page
                - specific subject page
            - logout
            - request account deletation

## Database Scheme
```
    Table admin {
      ID interger [primary key]
      username varchar(20) [primary key]
      password varchar(100)
    }

    Table subject {
      ID integer [primary key]
      name varchar(20) [primary key]
      date_added timestamp
    }

    Table paper {
      ID integer [primary key]
      subject_name varchar(20) [ref: > subject.name]
      title varchar(70)
      publication_date timestamp
    }

    Table user {
      ID integer [primary key]
      username varchar(20) [primary key]
      first_name varchar(20)
      last_name varchar(20)
      password varchar(100)
      email varchar(50)
      contact_no varchar(20)
      nationality varchar(15)
      university varchar(40)

    }

    Table authorship {
      user_ID interger [primary key]
      paper_ID integer [primary key]
    }

    Ref: authorship.user_ID > user.ID
    Ref: authorship.paper_ID > paper.ID
```
