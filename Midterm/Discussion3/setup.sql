PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS R_nullable;
DROP TABLE IF EXISTS R_empty;
DROP TABLE IF EXISTS R;

CREATE TABLE R (
    A integer PRIMARY KEY,
    B integer NOT NULL
);

CREATE TABLE R_empty (
    A integer PRIMARY KEY,
    B integer NOT NULL
);

CREATE TABLE R_nullable (
    A integer PRIMARY KEY,
    B integer
);

INSERT INTO R(A, B) VALUES
    (1, 10),
    (2, 25),
    (3, 25),
    (4, 7),
    (5, 18);

INSERT INTO R_nullable(A, B) VALUES
    (1, NULL),
    (2, NULL),
    (3, NULL);
