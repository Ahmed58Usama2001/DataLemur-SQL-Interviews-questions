with cte as(
SELECT measurement_id, measurement_value , measurement_time
, row_number()over(partition by measurement_time::DATE ORDER BY measurement_time
) as rn
FROM measurements
)
select  measurement_time::DATE  as measurement_day,
sum(measurement_value) FILTER(where rn%2!=0) as odd_sum,
sum(measurement_value) FILTER(where rn%2=0) as even_sum
from cte
group by measurement_time::DATE 
            ORDER BY measurement_time::DATE

