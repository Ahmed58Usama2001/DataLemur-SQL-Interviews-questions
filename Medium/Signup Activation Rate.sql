SELECT round(
count(t.email_id)::DECIMAL/
count(DISTINCT(e.email_id))
,2) as activation_rate
from emails e left JOIN texts t
on e.email_id=t.email_id
and t.signup_action = 'Confirmed'