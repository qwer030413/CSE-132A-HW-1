DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS classes;

CREATE TABLE classes (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT UNIQUE,
    number      TEXT,
    date_code   TEXT,
    start_time  TEXT,
    end_time    TEXT
);

CREATE TABLE students (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    pid         TEXT,
    first_name  TEXT,
    last_name   TEXT
);

CREATE TABLE enrollment (
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    class    INTEGER REFERENCES classes (id) NOT NULL,
    student  INTEGER REFERENCES students (id) NOT NULL,
    credits  INTEGER DEFAULT 4
);

INSERT INTO classes (name, number, date_code, start_time, end_time)
VALUES ('Web Stuff', 'MAS201', 'TuTh', '2:00', '3:20');

INSERT INTO classes (name, number, date_code, start_time, end_time)
VALUES ('Databases', 'CSE132A', 'TuTh', '3:30', '4:50');

INSERT INTO classes (name, number, date_code, start_time, end_time)
VALUES ('Compilers', 'CSE131', 'F', '9:30', '10:50');

INSERT INTO classes (name, number, date_code, start_time, end_time)
VALUES ('VLSI', 'CSE121', 'F', '11:00', '12:00');

INSERT INTO students (pid, first_name, last_name)
VALUES ('8888888', 'John', 'Smith');

INSERT INTO students (pid, first_name, last_name)
VALUES ('1111111', 'Mary', 'Doe');

INSERT INTO students (pid, first_name, last_name)
VALUES ('2222222', 'Jay', 'Chen');

INSERT INTO enrollment (class, student, credits) VALUES (1, 1, 4);
INSERT INTO enrollment (class, student, credits) VALUES (1, 2, 3);
INSERT INTO enrollment (class, student, credits) VALUES (4, 3, 4);
INSERT INTO enrollment (class, student, credits) VALUES (1, 3, 3);

-- There is no class with id 3.
DELETE FROM classes WHERE id = 3;
