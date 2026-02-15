with cte as(
select event_id,contact_id,event_type,
date_trunc('week',event_date) as event_week,
lag(date_trunc('week',event_date)) over(
partition by contact_id order by event_date) as lag_event_week,
lead(date_trunc('week',event_date)) over(
partition by contact_id order by event_date) as lead_event_week
FROM marketing_touches)

select c.email
from cte inner join crm_contacts c
on cte.contact_id = c.contact_id
WHERE lag_event_week = event_week - interval '1 week'
  and lead_event_week = event_week + interval '1 week'
  AND c.contact_id IN (
    SELECT contact_id 
    FROM marketing_touches 
    WHERE event_type = 'trial_request'
  );