# Write your MySQL query statement below

with cte as(

select * , Date_add(recordDate, INTERVAL -1 DAY) as yesterday
from Weather 
)

select current.id from 
cte current left join cte previous
on previous.recordDate =  current.yesterday
where current.temperature>previous.temperature;
