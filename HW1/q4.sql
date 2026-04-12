-- Active: 1775945047750@@127.0.0.1@3306
SELECT DISTINCT b1.cname AS name1
, b2.cname AS name2
FROM borrower b1
JOIN borrower b2
ON b1.lno = b2.lno
AND b1.cname < b2.cname
-- ORDER BY b1.cname, b2.cname;
ORDER BY name1, name2;