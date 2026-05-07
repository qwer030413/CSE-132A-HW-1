PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Teaches;
DROP TABLE IF EXISTS Enroll;
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
  sid INT PRIMARY KEY,
  name TEXT NOT NULL,
  major TEXT NOT NULL,
  gpa FLOAT NOT NULL
);

CREATE TABLE Course (
  cid INT PRIMARY KEY,
  title TEXT NOT NULL,
  dept TEXT NOT NULL
);

CREATE TABLE Enroll (
  sid INT NOT NULL,
  cid INT NOT NULL,
  grade TEXT NOT NULL,
  PRIMARY KEY (sid, cid),
  FOREIGN KEY (sid) REFERENCES Student(sid),
  FOREIGN KEY (cid) REFERENCES Course(cid)
);

CREATE TABLE Professor (
  pid INT PRIMARY KEY,
  name TEXT NOT NULL,
  dept TEXT NOT NULL
);

CREATE TABLE Teaches (
  pid INT NOT NULL,
  cid INT NOT NULL,
  PRIMARY KEY (pid, cid),
  FOREIGN KEY (pid) REFERENCES Professor(pid),
  FOREIGN KEY (cid) REFERENCES Course(cid)
);

INSERT INTO Student (sid, name, major, gpa) VALUES
  (1, 'Alice', 'CS', 3.90),
  (2, 'Amir', 'Math', 3.55),
  (3, 'Bella', 'CS', 3.20),
  (4, 'Carlos', 'Data Science', 3.72),
  (5, 'Diana', 'Biology', 3.41),
  (6, 'Ethan', 'CS', 2.95),
  (7, 'Fatima', 'Math', 3.88),
  (8, 'Grace', 'Economics', 3.67),
  (9, 'Hannah', 'Data Science', 3.83),
  (10, 'Ivan', 'Physics', 3.10),
  (11, 'Julia', 'Biology', 3.76),
  (12, 'Kevin', 'Economics', 2.84),
  (13, 'Lina', 'CS', 3.48),
  (14, 'Marco', 'Physics', 3.62),
  (15, 'Nora', 'Undeclared', 3.05);

INSERT INTO Course (cid, title, dept) VALUES
  (101, 'Intro to Programming', 'CS'),
  (102, 'Data Structures', 'CS'),
  (103, 'Database Systems', 'CS'),
  (201, 'Calculus I', 'Math'),
  (202, 'Linear Algebra', 'Math'),
  (301, 'Cell Biology', 'Biology'),
  (302, 'Genetics', 'Biology'),
  (401, 'Microeconomics', 'Economics'),
  (402, 'Econometrics', 'Economics'),
  (501, 'Classical Mechanics', 'Physics'),
  (502, 'Quantum Physics', 'Physics'),
  (601, 'Machine Learning', 'Data Science'),
  (602, 'Data Visualization', 'Data Science'),
  (999, 'Independent Study', 'CS');

INSERT INTO Professor (pid, name, dept) VALUES
  (1, 'Smith', 'CS'),
  (2, 'Johnson', 'Math'),
  (3, 'Lee', 'Biology'),
  (4, 'Patel', 'Economics'),
  (5, 'Garcia', 'Physics'),
  (6, 'Nguyen', 'Data Science'),
  (7, 'Brown', 'CS');

INSERT INTO Teaches (pid, cid) VALUES
  (1, 101),
  (1, 103),
  (7, 102),
  (7, 999),
  (2, 201),
  (2, 202),
  (3, 301),
  (3, 302),
  (4, 401),
  (4, 402),
  (5, 501),
  (5, 502),
  (6, 601),
  (6, 602),
  (1, 601);

INSERT INTO Enroll (sid, cid, grade) VALUES
  (1, 101, 'A'),
  (1, 102, 'A-'),
  (1, 103, 'A'),
  (1, 601, 'B+'),
  (2, 201, 'A-'),
  (2, 202, 'B+'),
  (2, 101, 'B'),
  (3, 101, 'B'),
  (3, 102, 'B-'),
  (3, 103, 'C+'),
  (4, 103, 'A-'),
  (4, 601, 'A'),
  (4, 602, 'A-'),
  (4, 202, 'B+'),
  (5, 301, 'B+'),
  (5, 302, 'B'),
  (5, 101, 'C+'),
  (6, 101, 'C'),
  (6, 102, 'C+'),
  (6, 103, 'B-'),
  (7, 201, 'A'),
  (7, 202, 'A'),
  (7, 103, 'A-'),
  (8, 401, 'A-'),
  (8, 402, 'B+'),
  (8, 201, 'B'),
  (9, 601, 'A'),
  (9, 602, 'A'),
  (9, 103, 'A-'),
  (10, 501, 'B'),
  (10, 502, 'B-'),
  (10, 201, 'C+'),
  (11, 301, 'A-'),
  (11, 302, 'A'),
  (11, 601, 'B+'),
  (12, 401, 'C+'),
  (12, 402, 'B-'),
  (13, 101, 'B+'),
  (13, 102, 'A-'),
  (13, 601, 'B'),
  (14, 501, 'A-'),
  (14, 502, 'B+'),
  (14, 202, 'B'),
  (15, 101, 'B-');

CREATE INDEX idx_enroll_sid ON Enroll(sid);
CREATE INDEX idx_enroll_cid ON Enroll(cid);
CREATE INDEX idx_teaches_pid ON Teaches(pid);
CREATE INDEX idx_teaches_cid ON Teaches(cid);
