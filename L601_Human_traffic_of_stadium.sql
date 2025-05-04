
CREATE TABLE stadium(id INT, visit_date DATE, people INT);
INSERT INTO stadium VALUES(1, '01/JAN/17', 10);
INSERT INTO stadium VALUES(2, '02/JAN/17', 109);
INSERT INTO stadium VALUES(3, '03/JAN/17', 150);
INSERT INTO stadium VALUES(4, '04/JAN/17', 99);
INSERT INTO stadium VALUES(5, '05/JAN/17', 145);
INSERT INTO stadium VALUES(6, '06/JAN/17', 1455);
INSERT INTO stadium VALUES(7, '07/JAN/17', 199);
INSERT INTO stadium VALUES(8, '08/JAN/17', 188);


with cte_s as (
select s.id,s.visit_date,s.people, lead(people,1) over(order by id) as lead1,  lead(people,2) over(order by id) as lead2,
lag(people,1) over(order by id) as lag1,  lag(people,2) over(order by id) as lag2
from stadium s)
select id,visit_date,people
from cte_s
where (people>100 and lead1>100 and lead2>100) or (people>100 and lag1>100 and lag2>100)
 or (people>100 and lag1>100 and lead1>100);