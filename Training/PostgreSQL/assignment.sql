a) SELECT a.name, e.salary from aircrafts as a JOIN certifieds as c ON a.id = c.eid JOIN employees as e USING(eid) WHERE e.salary > 80000 order by e.salary asc;

b) select e.eid , max(a.range), count(*) as number_of_certified_aircrafts from employees as e join certifieds as c1 using(eid) join aircrafts as a on a.id = c1.aid  group by e.eid having count(*) > 3
order by count(*);

c) SELECT e.ename FROM employees as e JOIN certifieds as c using(eid) WHERE salary < (SELECT MIN(price) FROM flight WHERE depart_location = 'Los Angeles' AND arrive_location = 'Honululu');

d) SELECT a.name, AVG(e.salary), a.range from aircrafts as a JOIN certifieds as c ON a.id = c.aid  JOIN employees as e USING (eid) WHERE range > 1000 GROUP BY ( a.name, a.range) order by a.range;

e) SELECT e.ename FROM employees as e JOIN certifieds as c USING(eid) JOIN aircrafts as a ON c.aid = a.id WHERE a.name = 'Boeing';

f) SELECT a.id from aircrafts as a WHERE range > (SELECT distance from flight where depart_location='Los Angeles' AND arrive_location='Chicago');


g) SELECT f.depart_location, arrive_location FROM flight AS f FULL JOIN employees as e ON e.eid = f.flight_no JOIN certifieds as c ON c.eid = e.eid JOIN aircrafts as a ON a.id = c.aid WHERE e.salary > 100000 AND f.distance < a.range;


h) SELECT ename, a.range, a.name from employees as e JOIN certifieds as c USING (eid) JOIN aircrafts as a ON a.id = c.aid  WHERE a.range > 3000 AND a.name!='Boeing' order by a.range;

i) 

j) SELECT (SELECT AVG(e.salary) AS avg_salary_of_pilots FROM employees as e JOIN certifieds as c USING(eid))- AVG(e.salary) as AvgSalaryDifference FROM employees as e;

k) select ename, salary from employees as e join certifieds as c using(eid) where salary > (SELECT AVG(e.salary) from employees as e join certifieds as c using(eid)) order by salary;

l) SELECT e.ename, a.range FROM employees as e JOIN certifieds as c USING(eid) JOIN
 aircrafts as a ON a.id = c.aid WHERE a.range > 1000 order by a.range asc;

m) select e.ename from employees as e join certifieds as c using(eid) join aircrafts as a on a.id = c.aid group by e.ename, a.range having a.range  >1000 and count(*)  >=2;

n) select e.ename, a.range, a.name from employees as e join certifieds as c using(eid) join aircrafts as a on a.id = c.aid  where a.name = 'Quatz' and a.range > 1000 order by a.range;

