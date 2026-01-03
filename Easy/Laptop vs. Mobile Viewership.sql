select 
(select count(*) from viewership where device_type = 'laptop') as laptop_views,
(select count(*) from viewership where device_type != 'laptop' )as mobile_views


