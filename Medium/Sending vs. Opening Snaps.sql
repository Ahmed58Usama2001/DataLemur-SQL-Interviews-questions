
select abd.age_bucket, round(100.0*
sum(a.time_spent) filter(where a.activity_type='send')
/sum(a.time_spent)
,2) as send_perc,
 round(100.0*
sum(a.time_spent) filter(where a.activity_type='open')
/sum(a.time_spent)
,2) as open_perc
from activities a inner join age_breakdown abd
on a.user_id =abd.user_id
where a.activity_type in('open','send')
group by abd.age_bucket
