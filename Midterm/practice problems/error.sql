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