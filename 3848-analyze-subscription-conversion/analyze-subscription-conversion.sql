# Write your MySQL query statement below


select user_id,
ROUND(sum(case when activity_type ='free_trial' then activity_duration else 0 end)/sum(case when activity_type ='free_trial' then 1 else 0 end),2) as trial_avg_duration,
ROUND(sum(case when activity_type ='paid' then activity_duration else 0 end)/sum(case when activity_type ='paid' then 1 else 0 end),2) as paid_avg_duration
from UserActivity
group by user_id
having paid_avg_duration is not null
order by user_id