select 
round(
sum(order_occurrences*item_count::DECIMAL)/
sum(order_occurrences)
,1)
as mean
from items_per_order
