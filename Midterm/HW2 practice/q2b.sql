DELETE FROM customer WHERE name IN (SELECT b.cname FROM borrower b JOIN loan l ON b.lno = l.no WHERE l.type = 'jumbo mortgage');

DELETE FROM borrower WHERE lno IN(SELECT no FROM loan WHERE type = 'jumbo mortgage' );

DELETE FROM loan WHERE type = 'jumbo mortgage';
