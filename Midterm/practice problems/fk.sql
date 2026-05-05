
create table department(
    did int primary key,
    name varchar(30)
)

create table student(
    sid int primary key,
    name varchar(30),
    did int,
    foreign key (did) references department(did)
)