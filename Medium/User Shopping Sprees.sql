select DISTINCT(t1.user_id)
from transactions t1 join transactions t2
on date(t2.transaction_date) = date(t1.transaction_date) +1
join transactions t3 
on date(t3.transaction_date) = date(t1.transaction_date) +2
order by t1.user_id