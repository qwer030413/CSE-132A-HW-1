-- Active: 1777152591262@@127.0.0.1@3306
SELECT DISTINCT c.name, l.no
FROM customer c
JOIN borrower b ON c.name = b.cname 
JOIN loan l ON b.lno = l.no
WHERE c.credit < l.minCredit;