-- self referencing FK 

create table employee(
    eid int primary key,
    ssn int unique not null,
    salary int,
    manager_id int
    foreign key (manager_id) references employee(eid)
)