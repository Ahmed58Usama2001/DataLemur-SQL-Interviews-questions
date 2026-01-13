with cte
as(
select max(order_occurrences) as most_occurence
from items_per_order 
)

select item_count as mode
from items_per_order join cte on items_per_order.order_occurrences = cte.most_occurence
order by item_count