CREATE TABLE Test (
  id INT,
  PRIMARY KEY (id),
  id INT
);
-- not valid sql because id appears 2 times


-- this is fine since we define id, then make it a primary key
CREATE TABLE Test (
  id INT,
  PRIMARY KEY (id),
);


-- not fine since we never declaired id and we are setting it as pk
CREATE TABLE Test (
  PRIMARY KEY (id),
  id INT
);


-- we can do primary key () if we want a composite key
CREATE TABLE Test (
  id INT,
  version INT,
  PRIMARY KEY (id, version)
);


-- invalid, existing rows will have NULL values, violates null constraint
-- sql does not allow adding not null columns without default
ALTER TABLE Employee ADD age INT NOT NULL;





-- bad because only one primary key is allowed
CREATE TABLE Test (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  PRIMARY KEY (name)
);


create table enrollment(
  sid int,
  foreign key (sid) references Student(sid),
  cid int,
   foreign key (cid) references Course(cid),
  grade varchar(10),
  PRIMARY KEY (sid, cid)
)

-- OR
CREATE TABLE enrollment (
  sid INT,
  cid INT,
  grade VARCHAR(10),
  PRIMARY KEY (sid, cid),
  FOREIGN KEY (sid) REFERENCES Student(sid),
  FOREIGN KEY (cid) REFERENCES Course(cid)
);
-- same thing
-- UNIQUE (id) : table-level constraint
-- id INT UNIQUE: column-level constraint

-- more stuff:
-- PRIMARY KEY implies NOT NULL
-- FOREIGN KEY must reference a PRIMARY KEY or UNIQUE
-- UNIQUE allows NULL values