CREATE DATABASE college;

CREATE SCHEMA acadamics;
CREATE SCHEMA accounts;
CREATE SCHEMA examinations;
CREATE SCHEMA placements;



CREATE TABLE acadamics.departments(id text PRIMARY KEY,name text NOT NULL,hod text NOT NULL REFERENCES academics.teachers(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE academics.sections(id text PRIMARY KEY,department_id text NOT NULL REFERENCES(academics.departments(id)) ON DELETE 
CASCADE,co_ordinator_teacher_id text NOT NULL REFERENCES academics.teachers(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TYPE qualification AS(degree_no int, degree text, majors text ,school text, from_year YEAR , to_year YEAR);

CREATE TABLE academics.teachers(id text PRIMARY KEY,name text NOT NULL,dob date NOT NULL,experience_years int NOT NULL,qualifications qualification[], co_ordination_section text REFERENCES academics.sections(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE academics.subjects(id text PEIMARY KEY, name text NOT NULL, department text REFERENCES academics.sections(id) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE academics.students(id text PRIMARY KEY, name NOT NULL, section_id text REFERENCES academics.sections(id) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE academics.teachers_sections(teacher_id text REFERENCES academics.teachers(id) ON UPDATE CASCADE ON DELETE CASCADE, section_id text REFERENCES academics.sections(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE academics.teachers_subjects(teacher_id text REFERENCES academics.teachers(id) ON UPDATE CASCADE ON DELETE CASCADE, subject_id text REFERENCES academics.subjects(id) ON UPDATE CASCADE ON DELETE CASCADE);




INSERT INTO academics.departments(id,name,sections,hod,teachers)VALUES('CE','Computer Engineering','T1');

INSERT INTO academics.departments(id, name, section, hod, teachers)VALUES('IT', 'Information Technology','T2'),('ECE', 'Electronics and Communications Engineering', 'T3'),('ME', 'Mechanical Engineering', 'T4'),('ELE', 'Electrical Engineering', 'T4');

INSERT INTO academics.sections(id, department_id, co_ordinator_teacher_id)VALUES('CE-2K19','CE','T10'),('CE-2K18','CE','T11'),('IT-2K19','IT','T11'),('IT-2K18','IT','T12'),('ECE-2K19','ECE','T13'),('ECE-2K18','ECE','T13');

INSERT INTO academics.teachers(id, name, dob, experience_years, qualifications,co_ordination_section)VALUES('T1','Komal Bhatia', '1970-01-01', 10, '{}',''),('T2','Atul Mishra', '1965-01-01', 15, '{}',''),('T3', 'Anil Shri', '1972-01-01', 12, '{}','');

INSERT INTO academics.subjects(id,name,department)VALUES('CE-SUB-01','FOCP','CE-2K19'),('CE-SUB-02', 'ABCD', 'CE-2K18'),('IT-SUB-01', 'ITSOFT', 'IT-2K19');

INSERT INTO academics.students(id,name, section_id)VALUES('000001','Manav Sethi', 'CE-2K18'),('000002','Avinash', 'CE-2K18');

INSERT INTO academics.teachers_sections(teacher_id, section_id)('T10','CE-2K18'),('T20','CE-2K18');

INSERT INTO academics.teachers_subjects(teacher_id, subject_id)('T10', 'CE-SUB-02');

\c northwind 
select min(orderdate) from orders where shipcountry='Italy';
select max(shippeddate) from orders where shipcountry='Italy';
select max(shippeddate) from orders where shipcountry='Canada';
select max(shippeddate-orderdate) from orders;
select max(shippeddate-orderdate) from orders where country='France';
select max(shippeddate-orderdate) from orders where shipcountry='France';
select avg(freight) from orders where shipcountry = 'Brazil';
select sum(quantity) from order_details where productid=14;
select avg(quantity) from order_details where productid=35;
select * from customers where contactname like 'D%';
select companyname from suppliers where companyname like '_or%';
select contanctname from customers where companyname like '%er';
select contactname from customers where companyname like '%er';
select contactname as Alias from customers where companyname like '%er';
select unitprice*quantity from order_details;
select unitprice*quantity from order_details limit 3;
select count(*) from customers where region is not null;
select count(*) from customers where region is null;
select count(*) from oders where shipregion is null;
select count(*) from orders where shipregion is null;
select firstname, lastname, orders.orderdate from employees inner join orders using(id);
select firstname, lastname, orders.orderdate from employees natural join orders;
select firstname, lastname, orders.orderdate from employees natural join orders;
select companyname, unitprice, unitsinstock from suppliers inner join products where suppliers.companyid = products.companyid;
select companyname, unitprice, unitsinstock from suppliers natural join products;
select companyname, orderdate, unitprice, quantity from ordrs inner join order_details on orders.orderid = order_details.orderid inner join customers on customers.customerid = orders.customerid;
select companyname, orderdate, unitprice, quantity from ordres inner join order_details on orders.orderid = order_details.orderid inner join customers on customers.customerid = orders.customerid;
select companyname, orderdate, unitprice, quantity from orders inner join order_details on orders.orderid = order_details.orderid inner join customers on customers.customerid = orders.customerid;
select COUNT(companyname), orderdate, unitprice, quantity from orders inner join order_details on orders.orderid = order_details.orderid inner join customers on customers.customerid = orders.customerid;
select DISTINCT(companyname), orderdate, unitprice, quantity from orders inner join order_details on orders.orderid = order_details.orderid inner join customers on customers.customerid = orders.customerid;
select companyname, productname, orderdate, order_details.unitprice, quantity from orders join order_details on orders.orderid = order_details.orderid inner join products on products.productid=order_details.productid;
select companyname, productname, orderdate, order_details.unitprice, quantity from orders join order_details on orders.orderid = order_details.orderid inner join products on products.productid=order_details.productid;
select products.companyname, productname, orderdate, order_details.unitprice, quantity from orders join order_details on orders.orderid = order_details.orderid inner join products on products.productid=order_details.productid;

select order_details.companyname, productname, orderdate, order_details.unitprice, quantity from orders join order_details on orders.orderid = order_details.orderid inner join products on products.productid=order_details.productid;
select companyname, productname, orderdate, order_details.unitprice, quantity from orders join order_details on orders.orderid = order_details.orderid inner join products on products.productid=order_details.productid;
select companyname, productname, orderdate, order_details.unitprice, quantity from orders join order_details on orders.orderid = order_details.orderid inner join products on products.productid=order_details.productid;
select companyname, productname, categoryname, orderdate, order_details.unitprice, quantity from orders join order_details on orders.orderid = order_details.orderid inner join products on products.productid=order_details.productid inner join categories on products.categoryid = categories.categoryid;
select companyname, orderid from customers left natural join orders;
select companyname, orderid from customers left join on oerders.customerid = customers.customerid;
select companyname, orderid from customers left join on orders.customerid = customers.customerid;
select companyname, orderid from customers left join orders on orders.customerid = customers.customerid;
select companyname, orderid from customers left join orders on orders.customerid = customers.customerid where customers.orderid is null;
select companyname, orderid from customers left join orders on orders.customerid = customers.customerid where orders.orderid is null;
select companyname, orderid from customers left join orders on orders.customerid = customers.customerid where orderid is null;
select productname, orderid from products left join order_details on products.productid = order_details.productid;
select count(*) from products left join order_details on products.productid = order_details.productid;
select count(*) from products left join order_details on products.productid = order_details.productid where orderid is null;
select companyname, orderid from orders right join customers on customers.customerid= orders.customerid;
select companyname, orderid from orders right join customers on customers.customerid= orders.customerid where orderid is null;
q
;
select companyname, customerid from customercustomerdemo right join customers on customercustomerdemo.customerid = customers.customerid;
select companyname, customers.customerid from customercustomerdemo right join customers on customercustomerdemo.customerid = customers.customerid;
select companyname, customercustomerdemo.customerid from customercustomerdemo right join customers on customercustomerdemo.customerid = customers.customerid;
select companyname, customercustomerdemo.customerid from customercustomerdemo right join customers on customercustomerdemo.customerid = customers.customerid where customerid is not null;
select companyname, customercustomerdemo.customerid from customercustomerdemo right join customers on customercustomerdemo.customerid = customers.customerid where customercustomerdemo.customerid is not null;
select companyname, customercustomerdemo.customerid from customercustomerdemo right join customers on customercustomerdemo.customerid = customers.customerid where customercustomerdemo.customerid is null;
select * from customercustomerdemo;
clear
;
select companyname, orderid from customers full join orders on customers.customerid = orders.customerid;
select productname, categoryname from products full join categories on products.categoryid = categories.categoryid;
select c1.companyname, c2.companyname, city from customers as c1 join customers as c2 on c1.city = c2.city order by city asc;
select c1.companyname, c2.companyname, c1.city from customers as c1 join customers as c2 on c1.city = c2.city order by city asc;

select c1.companyname Customer1, c2.companyname Customer2, c1.city from customers as c1 join customers as c2 on c1.city = c2.city order by city asc;
select c1.companyname Customer1, c2.companyname Customer2, c1.city from customers as c1 join customers as c2 on c1.city = c2.city where c1.cutomerid != c2.customerid order by city asc;
select c1.companyname Customer1, c2.companyname Customer2, c1.city from customers as c1 join customers as c2 on c1.city = c2.city where c1.customerid != c2.customerid order by city asc;
select t1.suppliername, t2.suppliername from suppliers as t1 join suppliers as t2 on t1.country = t2.country where t1.supplierid != t2.supplierid order by t1.suppliername asc;
select t1.companyname as Supplier1, t2.companyname as Supplier2, t1.country  from suppliers as t1 join suppliers as t2 on t1.country = t2.country where t1.supplierid != t2.supplierid order by t1.suppliername asc;
select t1.companyname as Supplier1, t2.companyname as Supplier2, t1.country  from suppliers as t1 join suppliers as t2 on t1.country = t2.country where t1.supplierid != t2.supplierid order by t1.companyname asc;
\o result.csv select t1.companyname as Supplier1, t2.companyname as Supplier2, t1.country  from suppliers as t1 join suppliers as t2 on t1.country = t2.country where t1.supplierid != t2.supplierid order by t1.companyname asc;
select t1.companyname as Supplier1, t2.companyname as Supplier2, t1.country  from suppliers as t1 join suppliers as t2 on t1.country = t2.country where t1.supplierid != t2.supplierid order by t1.companyname asc; \g result.csv
select t1.companyname as Supplier1, t2.companyname as Supplier2, t1.country  from suppliers as t1 join suppliers as t2 on t1.country = t2.country where t1.supplierid != t2.supplierid order by t1.companyname asc; \g result.xls
SELECT COUNT(*), country FROM customers GROUP BY country;
SELECT COUNT(*), country FROM customers GROUP BY country;
SELECT country, COUNT(*)FROM customers GROUP BY country order by  count(*) desc
;
SELECT country, COUNT(*)FROM customers GROUP BY country order by  count(*) desc;
SELECT country, COUNT(*)FROM customers GROUP BY country order by  count(*) desc; \g 
select categoryname , count(*) from categories join products on using(categoryid) group by categoryname order by  count(*) desc;
select categoryname , count(*) from categories join products using(categoryid) group by categoryname order by  count(*) desc;
select categoryname , count(*) from categories join products using(categoryid) group by categoryname order by  count(*) desc; \g STDOUT
select categoryname , count(*) from categories join products using(categoryid) order by  count(*) desc; \g STDOUT
SELECT country, count(*) from suppliers group by country order by country asc;
SELECT country, count(*) from suppliers group by country order by country asc; \g res
SELECT country, count(*) from suppliers group by country order by count(*) asc; \g res
select productname, sum(quantity * order_details.unitprice) AS AmountBought from products join order_details using(productid) group by productname having sum(quantity*order_details.unitprice) < 2000 order by AmountBought desc;
select productname, sum(quantity * order_details.unitprice) AS AmountBought from products join order_details using(productid) group by productname having sum(quantity*order_details.unitprice) < 2000 order by AmountBought desc; \g ress
select customername, sum(quanity * order_details.unitprice) as amountbought from customers join order_details using(customerid) group by customername order by amountbought desc; \f ress
select customername, sum(quanity * order_details.unitprice) as amountbought from customers join order_details using(customerid) group by customername order by amountbought desc; \g ress
select customername, sum(quanity * order_details.unitprice) as amountbought from customers join order_details using(orderid) group by customername order by amountbought desc; \g ress

select companyname, sum(quanity * order_details.unitprice) as amountbought from customers natural join order_details natural join orders group by customername order by amountbought desc; \g ress
select companyname, sum(quantity * order_details.unitprice) as amountbought from customers natural join order_details natural join orders group by customername order by amountbought desc; \g ress
select companyname, sum(quantity * order_details.unitprice) as amountbought from customers natural join order_details natural join orders group by companyname order by amountbought desc; \g ress
select companyname, sum(quantity * order_details.unitprice) as amountbought from customers natural join order_details natural join orders group by companyname order by amountbought desc; \g resss

