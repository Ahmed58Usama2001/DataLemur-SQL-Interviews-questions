with cte 
AS
(SELECT user_id,count(*) as no_of_tweetes
from tweets 
WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
group by user_id
)

select no_of_tweetes  as tweet_bucket , count(*) as users_num
from cte
group by no_of_tweetes