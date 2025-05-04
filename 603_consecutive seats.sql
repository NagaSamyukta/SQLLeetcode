
CREATE TABLE cinema(seat_id INT,free INT);
insert into cinema values(1,1);
insert into cinema values(2,0);
insert into cinema values(3,1);
insert into cinema values(4,1);
insert into cinema values(5,1);

select seat_id from (select seat_id, 
case when (free=1 and lag(free) over (order by seat_id)=1) 
or (free=1 and lead(free) over (order by seat_id)=1)
then 'Yes'
else 'No' end as consec
from cinema)a
where  consec='Yes';