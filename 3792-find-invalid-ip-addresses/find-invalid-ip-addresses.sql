# Write your MySQL query statement below
with cte as(
select *,
SUBSTRING_INDEX(ip, '.', 1) AS part1,
SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) AS part2,
SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) AS part3,
SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 4), '.', -1) AS part4,
(LENGTH(ip) - LENGTH(REPLACE(ip, '.', ''))) AS dot_count
from logs)

select #*
ip, count(ip) as invalid_count
from cte
where part1>255 or part2>255 or part3>255 or part4>255 or 
part1 like('0%') or part2 like('0%') or part3 like('0%') or part4 like('0%')
or dot_count!=3
group by ip
order by  invalid_count desc,ip  desc;