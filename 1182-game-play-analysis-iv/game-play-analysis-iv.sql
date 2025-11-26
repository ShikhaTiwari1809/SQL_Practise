# Write your MySQL query statement below
with cte as(
select player_id,
event_date,
LEAD(event_date,1) over(partition by player_id order by event_date) as next_game,
min(event_date) over(partition by player_id order by event_date) as first_game
from Activity)

select ROUND(count(player_id)/(select count(distinct player_id) as total_cnt from Activity),2) as fraction
from cte 
where event_date = first_game and datediff(next_game,event_date) =1
;