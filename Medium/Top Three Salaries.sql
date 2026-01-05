with cte 
as(
select 
name,
salary,department_id,
dense_rank () over (
partition by department_id order by salary desc) as ranking
from employee
)

SELECT d.department_name,cte.name,
cte.salary
from cte inner join department d
on cte.department_id = d.department_id
where cte.ranking <=3
order by d.department_name asc , cte.salary desc , cte.name asc