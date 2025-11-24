# Write your MySQL query statement below

select Signups.user_id,
ROUND(sum(Case when action ='confirmed' then 1 else 0 end) /
count(Signups.user_id) ,2) as confirmation_rate
from Confirmations c right join Signups on Signups.user_id = c.user_id
group by Signups.user_id







