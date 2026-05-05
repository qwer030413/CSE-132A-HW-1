CREATE TABLE Student(
    id INT PRIMARY KEY,
    name VARCHAR(50), NOT NULL,
    age INT,
    major VARCHAR(30)
)

create table course(
    cid int primary key,
    title varchar(30), unique
    credits int
)