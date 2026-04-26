-- we gotta delete from all 3 tables, the order matters since they reference eachother

-- DELETE FROM loan WHERE type = 'jumbo mortgage';

DELETE FROM customer WHERE name IN(SELECT cname from borrower WHERE lno IN(SELECT no from loan where type = 'jumbo mortgage'));
DELETE FROM borrower WHERE lno IN(SELECT no from loan where type = 'jumbo mortgage');

DELETE FROM loan WHERE type = 'jumbo mortgage';


