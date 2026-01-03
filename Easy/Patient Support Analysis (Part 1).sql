with cte AS
(
select policy_holder_id , count(case_id) as no_of_calls
from callers 
group by policy_holder_id
having count(case_id)>=3
)

SELECT count(policy_holder_id) as policy_holder_count
from cte
