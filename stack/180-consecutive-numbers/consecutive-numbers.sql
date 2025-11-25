# Write your MySQL query statement below
with cte as(
select *,
row_number() over(partition by num order by id) as rn,
id - row_number() over(partition by num order by id) as diff
from Logs)

select distinct num as ConsecutiveNums
from cte
group by num,diff
having count(diff)>=3