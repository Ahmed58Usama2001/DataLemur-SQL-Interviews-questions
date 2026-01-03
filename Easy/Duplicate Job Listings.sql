with cte 
as(select count (*) as c
from job_listings 
group by  company_id, title,description 
having count (*)=2
)

select count(*) as duplicate_companies
from cte