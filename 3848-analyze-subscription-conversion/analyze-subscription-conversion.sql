# Write your MySQL query statement below

select user_id, round(trial_avg_duration,2) as trial_avg_duration, round(paid_avg_duration,2) as paid_avg_duration from(
select user_id,
sum(case when activity_type ='free_trial' then activity_duration else 0 end)/sum(case when activity_type ='free_trial' then 1 else 0 end) as trial_avg_duration,
sum(case when activity_type ='paid' then activity_duration else 0 end)/sum(case when activity_type ='paid' then 1 else 0 end) as paid_avg_duration
from UserActivity
group by user_id)p
where paid_avg_duration is not null
order by user_id