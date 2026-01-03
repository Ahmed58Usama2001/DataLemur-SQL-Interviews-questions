
select account_id,sum(
CASE
        WHEN transaction_type = 'Withdrawal' THEN amount*-1
        ELSE amount
END

) as final_balance
from transactions
group by account_id