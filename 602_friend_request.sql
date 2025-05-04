
CREATE TABLE request_accepted(requester_id INT,accepter_id INT,  accept_date DATE);
insert into request_accepted values(1,2,'2016-06-03');
insert into request_accepted values(1,3,'2016-06-08');
insert into request_accepted values(2,3,'2016-06-08');
insert into request_accepted values(3,4,'2016-06-09');


select * from  request_accepted;

select id, sum(cnt)
from (
select requester_id as id,count(*) as cnt from request_accepted group by requester_id
union
select accepter_id as id ,count(*) as cnt from request_accepted group by accepter_id 
) a
group by id
order by sum(cnt) desc
limit 1;