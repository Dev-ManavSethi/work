a) SELECT a.name, e.salary from aircrafts as a JOIN certifieds as c ON a.id = c.eid JOIN employees as e USING(eid) WHERE e.salary > 80000 order by e.salary asc;



c) SELECT e.ename FROM employees as e JOIN certifieds as c using(eid) WHERE salary < (SELECT MIN(price) FROM flight WHERE depart_location = 'Los Angeles' AND arrive_location = 'Honululu');

d) SELECT a.name, AVG(e.salary), a.range from aircrafts as a JOIN certifieds as c ON a.id = c.aid  JOIN employees as e USING (eid) WHERE range > 1000 GROUP BY ( a.name, a.range) order by a.range;

e) SELECT e.ename FROM employees as e JOIN certifieds as c USING(eid) JOIN aircrafts as a ON c.aid = a.id WHERE a.name = 'Boeing';

f) SELECT a.id from aircrafts as a WHERE range > (SELECT distance from flight where depart_location='Los Angeles' AND arrive_location='Chicago');


g) SELECT f.depart_location, arrive_location FROM flight AS f FULL JOIN employees as e ON e.eid = f.flight_no JOIN certifieds as c ON c.eid = e.eid JOIN aircrafts as a ON a.id = c.aid WHERE e.salary > 100000 AND f.distance < a.range;


h) SELECT ename, a.range, a.name from employees as e JOIN certifieds as c USING (eid) JOIN aircrafts as a ON a.id = c.aid  WHERE a.range > 3000 AND a.name!='Boeing' order by a.range;


j) SELECT (SELECT AVG(e.salary) AS avg_salary_of_pilots FROM employees as e JOIN certifieds as c USING(eid))- AVG(e.salary) as AvgSalaryDifference FROM employees as e;

l) SELECT e.ename, a.range FROM employees as e JOIN certifieds as c USING(eid) JOIN
 aircrafts as a ON a.id = c.aid WHERE a.range > 1000 order by a.range asc;

