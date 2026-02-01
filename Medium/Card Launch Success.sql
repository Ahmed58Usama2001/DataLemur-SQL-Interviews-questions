with card_launch as(
SELECT card_name , issued_amount
,MAKE_DATE(issue_year, issue_month, 1) AS issue_date,
min(MAKE_DATE(issue_year, issue_month, 1)) over(partition by card_name) as launch_date
FROM monthly_cards_issued
)

select card_name , issued_amount
from card_launch
where issue_date = launch_date
ORDER BY issued_amount DESC;
