-- Active: 1775893322045@@127.0.0.1@3306
SELECT DISTINCT c.name AS name 
FROM customer c 
LEFT JOIN borrower b on c.name = b.cname
LEFT JOIN loan l ON b.lno = l.no
WHERE l.type = 'jumbo mortgage'
OR c.credit >= 750;