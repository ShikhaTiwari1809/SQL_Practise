# Write your MySQL query statement below

select name,bonus from Employee left join Bonus
on Employee.empID = Bonus.empID
where Bonus.empID is NULL or bonus<1000