CREATE DATABASE northwind;
sudo -u postgres psql northwind < /home/beryl/Desktop/nortwind/restore.sql 

\c northwind 

 
SELECT * FROM customers;
Total query runtime: 23 msec
91 rows retrieved.

 
SELECT * FROM employees;
Total query runtime: 13 msec
9 rows retrieved.

 
SELECT countries FROM customers;
ERROR:  column "countries" does not exist
LINE 1: SELECT countries FROM customers;
               ^
HINT:  Perhaps you meant to reference the column "customers.country".
********** Error **********

ERROR: column "countries" does not exist
SQL state: 42703
Hint: Perhaps you meant to reference the column "customers.country".
Character: 8

 
SELECT country FROM customers;
Total query runtime: 13 msec
91 rows retrieved.

 
SELECT DISTINCT(country) FROM customers;
Total query runtime: 15 msec
21 rows retrieved.

 
SELECT DISTINCT(country)
FROM customers
ORDER BY ASC;
ERROR:  syntax error at or near "ASC"
LINE 3: ORDER BY ASC;
                 ^
********** Error **********

ERROR: syntax error at or near "ASC"
SQL state: 42601
Character: 50

 
SELECT DISTINCT(country)
FROM customers
ORDER BY countru ASC;
ERROR:  column "countru" does not exist
LINE 3: ORDER BY countru ASC;
                 ^
HINT:  Perhaps you meant to reference the column "customers.country".

********** Error **********

ERROR: column "countru" does not exist
SQL state: 42703
Hint: Perhaps you meant to reference the column "customers.country".
Character: 50

 
SELECT DISTINCT(country)
FROM customers
ORDER BY country ASC;
Total query runtime: 2 msec
21 rows retrieved.

 
SELECT DISTINCT(country)
FROM customers
ORDER BY country DESC;
Total query runtime: 4 msec
21 rows retrieved.

 
SELECT DISTINCT country
FROM customers
ORDER BY country DESC;
Total query runtime: 2 msec
21 rows retrieved.

 
SELECT COUNT(country)
FROM customers
ORDER BY country DESC;
ERROR:  column "customers.country" must appear in the GROUP BY clause or be used in an aggregate function
LINE 3: ORDER BY country DESC;
                 ^

********** Error **********

ERROR: column "customers.country" must appear in the GROUP BY clause or be used in an aggregate function
SQL state: 42803
Character: 47

 
SELECT COUNT(country)
FROM customers;
Total query runtime: 9 msec
1 row retrieved.

 
SELECT COUNT(*)
FROM customers;
Total query runtime: 14 msec
1 row retrieved.

 
SELECT COUNT(*)
FROM orders;
Total query runtime: 13 msec
1 row retrieved.

 
SELECT COUNT(city)
FROM suppliers;
Total query runtime: 12 msec
1 row retrieved.

 
SELECT DISTINCT COUNT(city)
FROM order_details;
ERROR:  column "city" does not exist
LINE 1: SELECT DISTINCT COUNT(city)
                              ^

********** Error **********

ERROR: column "city" does not exist
SQL state: 42703
Character: 23

 
SELECT DISTINCT COUNT(product_id)
FROM order_details;
ERROR:  column "product_id" does not exist
LINE 1: SELECT DISTINCT COUNT(product_id)
                              ^
HINT:  Perhaps you meant to reference the column "order_details.productid".

********** Error **********

ERROR: column "product_id" does not exist
SQL state: 42703
Hint: Perhaps you meant to reference the column "order_details.productid".
Character: 23

 
SELECT DISTINCT COUNT(productid)
FROM order_details;
Total query runtime: 13 msec
1 row retrieved.

 
SELECT  COUNT(productid)
FROM order_details;
Total query runtime: 2 msec
1 row retrieved.

 
SELECT  COUNT(DISTINCT productid)
FROM order_details;
Total query runtime: 13 msec
1 row retrieved.

 
SELECT  customerid, ship_date - order_date AS ShippingTime
FROM order_details;
ERROR:  column "customerid" does not exist
LINE 1: SELECT  customerid, ship_date - order_date AS ShippingTime
                ^

********** Error **********

ERROR: column "customerid" does not exist
SQL state: 42703
Character: 9

 
SELECT  customerid, shippeddate - orderdate AS ShippingTime
FROM orders;
Total query runtime: 34 msec
830 rows retrieved.

 
SELECT  customerid, shippeddate - orderdate AS ShippingTime
FROM orders
ORDER BY customerid ASC;
Total query runtime: 31 msec
830 rows retrieved.

 
SELECT  price*quantity AS AmountSpent
FROM orders
ORDER BY AmountSpent ASC;
ERROR:  column "price" does not exist
LINE 1: SELECT  price*quantity AS AmountSpent
                ^

********** Error **********

ERROR: column "price" does not exist
SQL state: 42703
Character: 9

 
SELECT  unitprice*quantity AS AmountSpent
FROM order_details
ORDER BY AmountSpent ASC;
Total query runtime: 62 msec
2155 rows retrieved.

 
SELECT  orderid, unitprice*quantity AS AmountSpent
FROM order_details
ORDER BY AmountSpent ASC;
Total query runtime: 89 msec
2155 rows retrieved.

 
SELECT COUNT(*) FROM orders WHERE employeeid=3;
Total query runtime: 12 msec
1 row retrieved.

 
SELECT COUNT(*) FROM order_details WHERE quantity > 20;
Total query runtime: 12 msec
1 row retrieved.

 
SELECT COUNT(*) FROM order_details WHERE quantity >= 20;
Total query runtime: 3 msec
1 row retrieved.

 
SELECT COUNT(*) FROM order_details WHERE quantity <= 20;
Total query runtime: 12 msec
1 row retrieved.

 
SELECT COUNT(*) FROM order_details WHERE quantity =< 20;
ERROR:  operator does not exist: smallint =< integer
LINE 1: SELECT COUNT(*) FROM order_details WHERE quantity =< 20;
                                                          ^
HINT:  No operator matches the given name and argument type(s). You might need to add explicit type casts.

********** Error **********

ERROR: operator does not exist: smallint =< integer
SQL state: 42883
Hint: No operator matches the given name and argument type(s). You might need to add explicit type casts.
Character: 51

 
SELECT COUNT(*) FROM order_details WHERE quantity <= 20;
Total query runtime: 14 msec
1 row retrieved.

 
SELECT COUNT(*) FROM order_details WHERE quantity < 20 OR quatity = 20;
ERROR:  column "quatity" does not exist
LINE 1: ...OUNT(*) FROM order_details WHERE quantity < 20 OR quatity = ...
                                                             ^
HINT:  Perhaps you meant to reference the column "order_details.quantity".
********** Error **********

ERROR: column "quatity" does not exist
SQL state: 42703
Hint: Perhaps you meant to reference the column "order_details.quantity".
Character: 59

 
SELECT COUNT(*) FROM order_details WHERE quantity < 20 OR quantity = 20;
Total query runtime: 4 msec
1 row retrieved.

 
SELECT COUNT(*) FROM order_details WHERE quantity < 20 AND quantity = 20;
Total query runtime: 5 msec
1 row retrieved.

 
SELECT COUNT(*) FROM orders where orderdate >= '1998-01-01';
Total query runtime: 12 msec
1 row retrieved.

 
SELECT COUNT(*) FROM orders where orderdate >= '1998-01-01' AND orderdate<'1995-01-01';
Total query runtime: 3 msec
1 row retrieved.

 
SELECT COUNT(*) FROM orders where orderdate >= '1998-01-01' or orderdate<'1995-01-01';
Total query runtime: 16 msec
1 row retrieved.

 
SELECT COUNT(*) FROM customers WHERE country='Canada' OR 'Mexico';
ERROR:  invalid input syntax for type boolean: "Mexico"
LINE 1: ... COUNT(*) FROM customers WHERE country='Canada' OR 'Mexico';
                                                              ^

********** Error **********

ERROR: invalid input syntax for type boolean: "Mexico"
SQL state: 22P02
Character: 58

 
SELECT COUNT(*) FROM customers WHERE country='Canada' OR country='Mexico';
Total query runtime: 11 msec
1 row retrieved.

 
SELECT COUNT(*) FROM customers WHERE country not'Canada' OR country='Mexico';
ERROR:  syntax error at or near "not"
LINE 1: SELECT COUNT(*) FROM customers WHERE country not'Canada' OR ...
                                                     ^
********** Error **********

ERROR: syntax error at or near "not"
SQL state: 42601
Character: 46

 
SELECT COUNT(*) FROM customers WHERE country not ='Canada' OR country='Mexico';
ERROR:  syntax error at or near "not"
LINE 1: SELECT COUNT(*) FROM customers WHERE country not ='Canada' O...
                                                     ^
********** Error **********

ERROR: syntax error at or near "not"
SQL state: 42601
Character: 46

 
SELECT COUNT(*) FROM customers WHERE country != Canada' OR country='Mexico';
ERROR:  syntax error at or near "Mexico"
LINE 1: ...FROM customers WHERE country != Canada' OR country='Mexico';
                                                               ^

********** Error **********

ERROR: syntax error at or near "Mexico"
SQL state: 42601
Character: 69

 
SELECT COUNT(*) FROM customers WHERE country != 'Canada' OR country='Mexico';
Total query runtime: 18 msec
1 row retrieved.

 
SELECT COUNT(*) FROM customers WHERE NOT country = 'Canada' OR country='Mexico';	
Total query runtime: 2 msec
1 row retrieved.

 
SELECT COUNT(*) FROM customers WHERE NOT country = 'Canada' OR country='Mexico' AND NOT country='Spain';	
Total query runtime: 14 msec
1 row retrieved.

 
SELECT COUNT(*) FROM customers WHERE NOT country = 'Canada' OR country='Mexico' AND  country='Spain';	
Total query runtime: 2 msec
1 row retrieved.

 
SELECT COUNT(*) FROM customers WHERE NOT country = 'Canada' and country='Mexico' OR  country='Spain';	
Total query runtime: 26 msec
1 row retrieved.

 
SELECT * FROM orders WHERE shipcountry='Germany' AND freight<50 OR freight>175;
Total query runtime: 46 msec
157 rows retrieved.

 
SELECT COUNT(*) FROM orders WHERE shipcountry='Germany' AND freight<50 OR freight>175;
Total query runtime: 13 msec
1 row retrieved.

 
SELECT COUNT(*) FROM orders WHERE shipcountry='Germany' AND (freight<50 OR freight>175);
Total query runtime: 11 msec
1 row retrieved.

 
SELECT COUNT(*) FROM orders WHERE (shipcountry='Germany' AND freight<50) OR freight>175;
Total query runtime: 12 msec
1 row retrieved.

 
SELECT COUNT(*) FROM orders WHERE shipcountry='Germany' AND freight<50 OR freight>175;
Total query runtime: 12 msec
1 row retrieved.

 
SELECT COUNT(*) FROM orders WHERE BETWEEN freight<50 OR freight>175;
ERROR:  syntax error at or near "freight"
LINE 1: SELECT COUNT(*) FROM orders WHERE BETWEEN freight<50 OR frei...
                                                  ^

********** Error **********

ERROR: syntax error at or near "freight"
SQL state: 42601
Character: 43

 
SELECT COUNT(*) FROM orders WHERE BETWEEN freight<50 AND freight>175;
ERROR:  syntax error at or near "freight"
LINE 1: SELECT COUNT(*) FROM orders WHERE BETWEEN freight<50 AND fre...
                                                  ^
********** Error **********

ERROR: syntax error at or near "freight"
SQL state: 42601
Character: 43

 
SELECT COUNT(*) FROM orders WHERE freight BETWEEN 50 OR 175;
ERROR:  syntax error at or near "OR"
LINE 1: SELECT COUNT(*) FROM orders WHERE freight BETWEEN 50 OR 175;
                                                             ^
********** Error **********

ERROR: syntax error at or near "OR"
SQL state: 42601
Character: 54

 
SELECT COUNT(*) FROM orders WHERE freight BETWEEN 50 AND 175;
Total query runtime: 7 msec
1 row retrieved.

 
SELECT COUNT(*) from suppliers WHERE country IN ('Germany', 'Spain', 'Italy');
Total query runtime: 12 msec
1 row retrieved.


 
SELECT COUNT(*) from suppliers WHERE country IN ['Germany', 'Spain', 'Italy'];
ERROR:  syntax error at or near "["
LINE 1: SELECT COUNT(*) from suppliers WHERE country IN ['Germany', ...
                                                        ^

********** Error **********

ERROR: syntax error at or near "["
SQL state: 42601
Character: 49







SELECT min(ORDERdate) FROM ORDERs WHERE shipCOUNTry='Italy';
SELECT max(shippeddate) FROM ORDERs WHERE shipCOUNTry='Italy';
SELECT max(shippeddate) FROM ORDERs WHERE shipCOUNTry='Canada';
SELECT max(shippeddate-ORDERdate) FROM ORDERs;
SELECT max(shippeddate-ORDERdate) FROM ORDERs WHERE COUNTry='France';
SELECT max(shippeddate-ORDERdate) FROM ORDERs WHERE shipCOUNTry='France';
SELECT AVG(freight) FROM ORDERs WHERE shipCOUNTry = 'Brazil';
SELECT SUM(quantity) FROM ORDER_details WHERE productid=14;
SELECT AVG(quantity) FROM ORDER_details WHERE productid=35;
SELECT * FROM customers WHERE cONtactname like 'D%';
SELECT companyname FROM suppliers WHERE companyname like '_or%';
SELECT cONtanctname FROM customers WHERE companyname like '%er';
SELECT cONtactname FROM customers WHERE companyname like '%er';
SELECT cONtactname AS AliAS FROM customers WHERE companyname like '%er';
SELECT unitprice*quantity FROM ORDER_details;
SELECT unitprice*quantity FROM ORDER_details limit 3;
SELECT COUNT(*) FROM customers WHERE regiON IS not NULL;
SELECT COUNT(*) FROM customers WHERE regiON IS NULL;
SELECT COUNT(*) FROM oders WHERE shipregiON IS NULL;
SELECT COUNT(*) FROM ORDERs WHERE shipregiON IS NULL;
SELECT firstname, lAStname, ORDERs.ORDERdate FROM employees INNER JOIN ORDERs USING(id);
SELECT firstname, lAStname, ORDERs.ORDERdate FROM employees NATURAL JOIN ORDERs;
SELECT firstname, lAStname, ORDERs.ORDERdate FROM employees NATURAL JOIN ORDERs;
SELECT companyname, unitprice, unitsinstock FROM suppliers INNER JOIN products WHERE suppliers.companyid = products.companyid;
SELECT companyname, unitprice, unitsinstock FROM suppliers NATURAL JOIN products;
SELECT companyname, ORDERdate, unitprice, quantity FROM ordrs INNER JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN customers ON customers.customerid = ORDERs.customerid;
SELECT companyname, ORDERdate, unitprice, quantity FROM ordres INNER JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN customers ON customers.customerid = ORDERs.customerid;
SELECT companyname, ORDERdate, unitprice, quantity FROM ORDERs INNER JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN customers ON customers.customerid = ORDERs.customerid;
SELECT COUNT(companyname), ORDERdate, unitprice, quantity FROM ORDERs INNER JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN customers ON customers.customerid = ORDERs.customerid;
SELECT DISTINCT(companyname), ORDERdate, unitprice, quantity FROM ORDERs INNER JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN customers ON customers.customerid = ORDERs.customerid;
SELECT companyname, productname, ORDERdate, ORDER_details.unitprice, quantity FROM ORDERs JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN products ON products.productid=ORDER_details.productid;
SELECT companyname, productname, ORDERdate, ORDER_details.unitprice, quantity FROM ORDERs JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN products ON products.productid=ORDER_details.productid;
SELECT products.companyname, productname, ORDERdate, ORDER_details.unitprice, quantity FROM ORDERs JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN products ON products.productid=ORDER_details.productid;

SELECT ORDER_details.companyname, productname, ORDERdate, ORDER_details.unitprice, quantity FROM ORDERs JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN products ON products.productid=ORDER_details.productid;
SELECT companyname, productname, ORDERdate, ORDER_details.unitprice, quantity FROM ORDERs JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN products ON products.productid=ORDER_details.productid;
SELECT companyname, productname, ORDERdate, ORDER_details.unitprice, quantity FROM ORDERs JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN products ON products.productid=ORDER_details.productid;
SELECT companyname, productname, categoryname, ORDERdate, ORDER_details.unitprice, quantity FROM ORDERs JOIN ORDER_details ON ORDERs.ORDERid = ORDER_details.ORDERid INNER JOIN products ON products.productid=ORDER_details.productid INNER JOIN categories ON products.categoryid = categories.categoryid;
SELECT companyname, ORDERid FROM customers LEFT NATURAL JOIN ORDERs;
SELECT companyname, ORDERid FROM customers LEFT JOIN ON oerders.customerid = customers.customerid;
SELECT companyname, ORDERid FROM customers LEFT JOIN ON ORDERs.customerid = customers.customerid;
SELECT companyname, ORDERid FROM customers LEFT JOIN ORDERs ON ORDERs.customerid = customers.customerid;
SELECT companyname, ORDERid FROM customers LEFT JOIN ORDERs ON ORDERs.customerid = customers.customerid WHERE customers.ORDERid IS NULL;
SELECT companyname, ORDERid FROM customers LEFT JOIN ORDERs ON ORDERs.customerid = customers.customerid WHERE ORDERs.ORDERid IS NULL;
SELECT companyname, ORDERid FROM customers LEFT JOIN ORDERs ON ORDERs.customerid = customers.customerid WHERE ORDERid IS NULL;
SELECT productname, ORDERid FROM products LEFT JOIN ORDER_details ON products.productid = ORDER_details.productid;
SELECT COUNT(*) FROM products LEFT JOIN ORDER_details ON products.productid = ORDER_details.productid;
SELECT COUNT(*) FROM products LEFT JOIN ORDER_details ON products.productid = ORDER_details.productid WHERE ORDERid IS NULL;
SELECT companyname, ORDERid FROM ORDERs RIGHT JOIN customers ON customers.customerid= ORDERs.customerid;
SELECT companyname, ORDERid FROM ORDERs RIGHT JOIN customers ON customers.customerid= ORDERs.customerid WHERE ORDERid IS NULL;

SELECT companyname, customerid FROM customercustomerdemo RIGHT JOIN customers ON customercustomerdemo.customerid = customers.customerid;

SELECT companyname, customers.customerid FROM customercustomerdemo RIGHT JOIN customers ON customercustomerdemo.customerid = customers.customerid;
SELECT companyname, customercustomerdemo.customerid FROM customercustomerdemo RIGHT JOIN customers ON customercustomerdemo.customerid = customers.customerid;
SELECT companyname, customercustomerdemo.customerid FROM customercustomerdemo RIGHT JOIN customers ON customercustomerdemo.customerid = customers.customerid WHERE customerid IS not NULL;
SELECT companyname, customercustomerdemo.customerid FROM customercustomerdemo RIGHT JOIN customers ON customercustomerdemo.customerid = customers.customerid WHERE customercustomerdemo.customerid IS not NULL;
SELECT companyname, customercustomerdemo.customerid FROM customercustomerdemo RIGHT JOIN customers ON customercustomerdemo.customerid = customers.customerid WHERE customercustomerdemo.customerid IS NULL;
SELECT * FROM customercustomerdemo; 
SELECT companyname, ORDERid FROM customers FULL JOIN ORDERs ON customers.customerid = ORDERs.customerid;
SELECT productname, categoryname FROM products FULL JOIN categories ON products.categoryid = categories.categoryid;
SELECT c1.companyname, c2.companyname, city FROM customers AS c1 JOIN customers AS c2 ON c1.city = c2.city ORDER BY city ASC;
SELECT c1.companyname, c2.companyname, c1.city FROM customers AS c1 JOIN customers AS c2 ON c1.city = c2.city ORDER BY city ASC;

SELECT c1.companyname Customer1, c2.companyname Customer2, c1.city FROM customers AS c1 JOIN customers AS c2 ON c1.city = c2.city ORDER BY city ASC;
SELECT c1.companyname Customer1, c2.companyname Customer2, c1.city FROM customers AS c1 JOIN customers AS c2 ON c1.city = c2.city WHERE c1.cutomerid != c2.customerid ORDER BY city ASC;
SELECT c1.companyname Customer1, c2.companyname Customer2, c1.city FROM customers AS c1 JOIN customers AS c2 ON c1.city = c2.city WHERE c1.customerid != c2.customerid ORDER BY city ASC;
SELECT t1.suppliername, t2.suppliername FROM suppliers AS t1 JOIN suppliers AS t2 ON t1.COUNTry = t2.COUNTry WHERE t1.supplierid != t2.supplierid ORDER BY t1.suppliername ASC;
SELECT t1.companyname AS Supplier1, t2.companyname AS Supplier2, t1.COUNTry  FROM suppliers AS t1 JOIN suppliers AS t2 ON t1.COUNTry = t2.COUNTry WHERE t1.supplierid != t2.supplierid ORDER BY t1.suppliername ASC;
SELECT t1.companyname AS Supplier1, t2.companyname AS Supplier2, t1.COUNTry  FROM suppliers AS t1 JOIN suppliers AS t2 ON t1.COUNTry = t2.COUNTry WHERE t1.supplierid != t2.supplierid ORDER BY t1.companyname ASC;
\o result.csv SELECT t1.companyname AS Supplier1, t2.companyname AS Supplier2, t1.COUNTry  FROM suppliers AS t1 JOIN suppliers AS t2 ON t1.COUNTry = t2.COUNTry WHERE t1.supplierid != t2.supplierid ORDER BY t1.companyname ASC;
SELECT t1.companyname AS Supplier1, t2.companyname AS Supplier2, t1.COUNTry  FROM suppliers AS t1 JOIN suppliers AS t2 ON t1.COUNTry = t2.COUNTry WHERE t1.supplierid != t2.supplierid ORDER BY t1.companyname ASC; \g result.csv
SELECT t1.companyname AS Supplier1, t2.companyname AS Supplier2, t1.COUNTry  FROM suppliers AS t1 JOIN suppliers AS t2 ON t1.COUNTry = t2.COUNTry WHERE t1.supplierid != t2.supplierid ORDER BY t1.companyname ASC; \g result.xls
SELECT COUNT(*), COUNTry FROM customers GROUP BY COUNTry;
SELECT COUNT(*), COUNTry FROM customers GROUP BY COUNTry;
SELECT COUNTry, COUNT(*)FROM customers GROUP BY COUNTry ORDER BY  COUNT(*) DESC;
SELECT COUNTry, COUNT(*)FROM customers GROUP BY COUNTry ORDER BY  COUNT(*) DESC;
SELECT COUNTry, COUNT(*)FROM customers GROUP BY COUNTry ORDER BY  COUNT(*) DESC; \g 
SELECT categoryname , COUNT(*) FROM categories JOIN products ON USING(categoryid) GROUP BY categoryname ORDER BY  COUNT(*) DESC;
SELECT categoryname , COUNT(*) FROM categories JOIN products USING(categoryid) GROUP BY categoryname ORDER BY  COUNT(*) DESC;
SELECT categoryname , COUNT(*) FROM categories JOIN products USING(categoryid) GROUP BY categoryname ORDER BY  COUNT(*) DESC; \g STDOUT
SELECT categoryname , COUNT(*) FROM categories JOIN products USING(categoryid) ORDER BY  COUNT(*) DESC; \g STDOUT
SELECT COUNTry, COUNT(*) FROM suppliers GROUP BY COUNTry ORDER BY COUNTry ASC;
SELECT COUNTry, COUNT(*) FROM suppliers GROUP BY COUNTry ORDER BY COUNTry ASC; \g res
SELECT COUNTry, COUNT(*) FROM suppliers GROUP BY COUNTry ORDER BY COUNT(*) ASC; \g res
SELECT productname, SUM(quantity * ORDER_details.unitprice) AS AmountBought FROM products JOIN ORDER_details USING(productid) GROUP BY productname HAVING SUM(quantity*ORDER_details.unitprice) < 2000 ORDER BY AmountBought DESC;
SELECT productname, SUM(quantity * ORDER_details.unitprice) AS AmountBought FROM products JOIN ORDER_details USING(productid) GROUP BY productname HAVING SUM(quantity*ORDER_details.unitprice) < 2000 ORDER BY AmountBought DESC; \g ress
SELECT customername, SUM(quanity * ORDER_details.unitprice) AS amountbought FROM customers JOIN ORDER_details USING(customerid) GROUP BY customername ORDER BY amountbought DESC; \f ress
SELECT customername, SUM(quanity * ORDER_details.unitprice) AS amountbought FROM customers JOIN ORDER_details USING(customerid) GROUP BY customername ORDER BY amountbought DESC; \g ress
SELECT customername, SUM(quanity * ORDER_details.unitprice) AS amountbought FROM customers JOIN ORDER_details USING(ORDERid) GROUP BY customername ORDER BY amountbought DESC; \g ress

SELECT companyname, SUM(quanity * ORDER_details.unitprice) AS amountbought FROM customers NATURAL JOIN ORDER_details NATURAL JOIN ORDERs GROUP BY customername ORDER BY amountbought DESC; \g ress
SELECT companyname, SUM(quantity * ORDER_details.unitprice) AS amountbought FROM customers NATURAL JOIN ORDER_details NATURAL JOIN ORDERs GROUP BY customername ORDER BY amountbought DESC; \g ress
SELECT companyname, SUM(quantity * ORDER_details.unitprice) AS amountbought FROM customers NATURAL JOIN ORDER_details NATURAL JOIN ORDERs GROUP BY companyname ORDER BY amountbought DESC; \g ress
SELECT companyname, SUM(quantity * ORDER_details.unitprice) AS amountbought FROM customers NATURAL JOIN ORDER_details NATURAL JOIN ORDERs GROUP BY companyname ORDER BY amountbought DESC; \g resss

SELECT categoryname, productname, SUM(od.unitprice*quantity) FROM categories NATURAL JOIN products NATURAL JOIN ORDER_details AS od GROUP BY (categoryname, productname) ORDER BY categoryname, productname; \g GROUPing sets
SELECT categoryname, productname, SUM(od.unitprice*quantity) FROM categories NATURAL JOIN products NATURAL JOIN ORDER_details AS od GROUP BY (categoryname) ORDER BY categoryname, productname; \g GROUPing sets
SELECT c.companyname AS buyer, s.companyname AS supplier, SUM(quantity*od.unitprice) FROM customers AS c JOIN suppliers AS s USING(supplierid) NATURAL JOIN ORDER_details AS od NATURAL JOIN ORDERs JOIN products USING(productsid) GROUP BY(buyer, (buyer,supplier)) ORDER BY buyer, supplier; \g gs 
SELECT c.companyname AS buyer, s.companyname AS supplier, SUM(quantity*od.unitprice) FROM customers AS c NATURAL JOIN ORDERs NATURAL JOIN ORDER_details AS od JOIN products USING(productid) JOIN suppliers AS s USING(supplierid) GROUP BY(buyer, (buyer,supplier)) ORDER BY buyer, supplier; \g gs 
SELECT c.companyname, categoryname, productname, SUM(od.unitprice*quantity) FROM customers AS c NATURAL JOIN ORDERs NATURAL JOIN ORDER_details AS od JOIN products USING (productid) JOIN categories USING (categoryid) GROUP BY ROLLUP (companyname, categoryname, productname); \g ROLLUP
\s

