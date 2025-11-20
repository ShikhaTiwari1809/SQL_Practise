# Write your MySQL query statement below


select user_id,
ROUND(AVG(CASE WHEN activity_type = 'free_trial' THEN activity_duration END), 2) AS trial_avg_duration,
ROUND(AVG(CASE WHEN activity_type = 'paid' THEN activity_duration END), 2) AS paid_avg_duration
from UserActivity
group by user_id
having paid_avg_duration is not null
order by user_id