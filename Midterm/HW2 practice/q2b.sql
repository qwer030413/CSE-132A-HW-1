-- Delete all “jumbo mortgage” loans as well as the customers who took them. Do this carefully to avoid violating the referential integrity constraints.

DELETE FROM customer WHERE name IN(SELECT cname from borrower WHERE lno IN(SELECT no from loan where type = 'jumbo mortgage'));
DELETE FROM borrower WHERE lno IN(SELECT no from loan where type = 'jumbo mortgage');

DELETE FROM loan WHERE type = 'jumbo mortgage';