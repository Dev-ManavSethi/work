-- Executing query:
SELECT * FROM customers;
Total query runtime: 23 msec
91 rows retrieved.

-- Executing query:
SELECT * FROM employees;
Total query runtime: 13 msec
9 rows retrieved.

-- Executing query:
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

-- Executing query:
SELECT country FROM customers;
Total query runtime: 13 msec
91 rows retrieved.

-- Executing query:
SELECT DISTINCT(country) FROM customers;
Total query runtime: 15 msec
21 rows retrieved.

-- Executing query:
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

-- Executing query:
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

-- Executing query:
SELECT DISTINCT(country)
FROM customers
ORDER BY country ASC;
Total query runtime: 2 msec
21 rows retrieved.

-- Executing query:
SELECT DISTINCT(country)
FROM customers
ORDER BY country DESC;
Total query runtime: 4 msec
21 rows retrieved.

-- Executing query:
SELECT DISTINCT country
FROM customers
ORDER BY country DESC;
Total query runtime: 2 msec
21 rows retrieved.

-- Executing query:
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

-- Executing query:
SELECT COUNT(country)
FROM customers;
Total query runtime: 9 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*)
FROM customers;
Total query runtime: 14 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*)
FROM orders;
Total query runtime: 13 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(city)
FROM suppliers;
Total query runtime: 12 msec
1 row retrieved.

-- Executing query:
SELECT DISTINCT COUNT(city)
FROM order_details;
ERROR:  column "city" does not exist
LINE 1: SELECT DISTINCT COUNT(city)
                              ^

********** Error **********

ERROR: column "city" does not exist
SQL state: 42703
Character: 23

-- Executing query:
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

-- Executing query:
SELECT DISTINCT COUNT(productid)
FROM order_details;
Total query runtime: 13 msec
1 row retrieved.

-- Executing query:
SELECT  COUNT(productid)
FROM order_details;
Total query runtime: 2 msec
1 row retrieved.

-- Executing query:
SELECT  COUNT(DISTINCT productid)
FROM order_details;
Total query runtime: 13 msec
1 row retrieved.

-- Executing query:
SELECT  customerid, ship_date - order_date AS ShippingTime
FROM order_details;
ERROR:  column "customerid" does not exist
LINE 1: SELECT  customerid, ship_date - order_date AS ShippingTime
                ^

********** Error **********

ERROR: column "customerid" does not exist
SQL state: 42703
Character: 9

-- Executing query:
SELECT  customerid, shippeddate - orderdate AS ShippingTime
FROM orders;
Total query runtime: 34 msec
830 rows retrieved.

-- Executing query:
SELECT  customerid, shippeddate - orderdate AS ShippingTime
FROM orders
ORDER BY customerid ASC;
Total query runtime: 31 msec
830 rows retrieved.

-- Executing query:
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

-- Executing query:
SELECT  unitprice*quantity AS AmountSpent
FROM order_details
ORDER BY AmountSpent ASC;
Total query runtime: 62 msec
2155 rows retrieved.

-- Executing query:
SELECT  orderid, unitprice*quantity AS AmountSpent
FROM order_details
ORDER BY AmountSpent ASC;
Total query runtime: 89 msec
2155 rows retrieved.

-- Executing query:
SELECT COUNT(*) FROM orders WHERE employeeid=3;
Total query runtime: 12 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM order_details WHERE quantity > 20;
Total query runtime: 12 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM order_details WHERE quantity >= 20;
Total query runtime: 3 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM order_details WHERE quantity <= 20;
Total query runtime: 12 msec
1 row retrieved.

-- Executing query:
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

-- Executing query:
SELECT COUNT(*) FROM order_details WHERE quantity <= 20;
Total query runtime: 14 msec
1 row retrieved.

-- Executing query:
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

-- Executing query:
SELECT COUNT(*) FROM order_details WHERE quantity < 20 OR quantity = 20;
Total query runtime: 4 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM order_details WHERE quantity < 20 AND quantity = 20;
Total query runtime: 5 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM orders where orderdate >= '1998-01-01';
Total query runtime: 12 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM orders where orderdate >= '1998-01-01' AND orderdate<'1995-01-01';
Total query runtime: 3 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM orders where orderdate >= '1998-01-01' or orderdate<'1995-01-01';
Total query runtime: 16 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM customers WHERE country='Canada' OR 'Mexico';
ERROR:  invalid input syntax for type boolean: "Mexico"
LINE 1: ... COUNT(*) FROM customers WHERE country='Canada' OR 'Mexico';
                                                              ^

********** Error **********

ERROR: invalid input syntax for type boolean: "Mexico"
SQL state: 22P02
Character: 58

-- Executing query:
SELECT COUNT(*) FROM customers WHERE country='Canada' OR country='Mexico';
Total query runtime: 11 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM customers WHERE country not'Canada' OR country='Mexico';
ERROR:  syntax error at or near "not"
LINE 1: SELECT COUNT(*) FROM customers WHERE country not'Canada' OR ...
                                                     ^
********** Error **********

ERROR: syntax error at or near "not"
SQL state: 42601
Character: 46

-- Executing query:
SELECT COUNT(*) FROM customers WHERE country not ='Canada' OR country='Mexico';
ERROR:  syntax error at or near "not"
LINE 1: SELECT COUNT(*) FROM customers WHERE country not ='Canada' O...
                                                     ^
********** Error **********

ERROR: syntax error at or near "not"
SQL state: 42601
Character: 46

-- Executing query:
SELECT COUNT(*) FROM customers WHERE country != Canada' OR country='Mexico';
ERROR:  syntax error at or near "Mexico"
LINE 1: ...FROM customers WHERE country != Canada' OR country='Mexico';
                                                               ^

********** Error **********

ERROR: syntax error at or near "Mexico"
SQL state: 42601
Character: 69

-- Executing query:
SELECT COUNT(*) FROM customers WHERE country != 'Canada' OR country='Mexico';
Total query runtime: 18 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM customers WHERE NOT country = 'Canada' OR country='Mexico';	
Total query runtime: 2 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM customers WHERE NOT country = 'Canada' OR country='Mexico' AND NOT country='Spain';	
Total query runtime: 14 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM customers WHERE NOT country = 'Canada' OR country='Mexico' AND  country='Spain';	
Total query runtime: 2 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM customers WHERE NOT country = 'Canada' and country='Mexico' OR  country='Spain';	
Total query runtime: 26 msec
1 row retrieved.

-- Executing query:
SELECT * FROM orders WHERE shipcountry='Germany' AND freight<50 OR freight>175;
Total query runtime: 46 msec
157 rows retrieved.

-- Executing query:
SELECT COUNT(*) FROM orders WHERE shipcountry='Germany' AND freight<50 OR freight>175;
Total query runtime: 13 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM orders WHERE shipcountry='Germany' AND (freight<50 OR freight>175);
Total query runtime: 11 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM orders WHERE (shipcountry='Germany' AND freight<50) OR freight>175;
Total query runtime: 12 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM orders WHERE shipcountry='Germany' AND freight<50 OR freight>175;
Total query runtime: 12 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) FROM orders WHERE BETWEEN freight<50 OR freight>175;
ERROR:  syntax error at or near "freight"
LINE 1: SELECT COUNT(*) FROM orders WHERE BETWEEN freight<50 OR frei...
                                                  ^

********** Error **********

ERROR: syntax error at or near "freight"
SQL state: 42601
Character: 43

-- Executing query:
SELECT COUNT(*) FROM orders WHERE BETWEEN freight<50 AND freight>175;
ERROR:  syntax error at or near "freight"
LINE 1: SELECT COUNT(*) FROM orders WHERE BETWEEN freight<50 AND fre...
                                                  ^
********** Error **********

ERROR: syntax error at or near "freight"
SQL state: 42601
Character: 43

-- Executing query:
SELECT COUNT(*) FROM orders WHERE freight BETWEEN 50 OR 175;
ERROR:  syntax error at or near "OR"
LINE 1: SELECT COUNT(*) FROM orders WHERE freight BETWEEN 50 OR 175;
                                                             ^
********** Error **********

ERROR: syntax error at or near "OR"
SQL state: 42601
Character: 54

-- Executing query:
SELECT COUNT(*) FROM orders WHERE freight BETWEEN 50 AND 175;
Total query runtime: 7 msec
1 row retrieved.

-- Executing query:
SELECT COUNT(*) from suppliers WHERE country IN ('Germany', 'Spain', 'Italy');
Total query runtime: 12 msec
1 row retrieved.


-- Executing query:
SELECT COUNT(*) from suppliers WHERE country IN ['Germany', 'Spain', 'Italy'];
ERROR:  syntax error at or near "["
LINE 1: SELECT COUNT(*) from suppliers WHERE country IN ['Germany', ...
                                                        ^

********** Error **********

ERROR: syntax error at or near "["
SQL state: 42601
Character: 49


