# Write your MySQL query statement below

select stock_name,
#LEAD(price,1) over (partition by stock_name order by operation_day) as next_price,
#LEAD(price,1) over (partition by stock_name order by operation_day)-price as pride_diff,
SUM(CASE WHEN operation = 'Buy' THEN -price ELSE price END) AS capital_gain_loss
from Stocks
group by stock_name