WITH call_gaps AS (
    SELECT
        policy_holder_id,
        call_date,
        LAG(call_date) OVER (
            PARTITION BY policy_holder_id
            ORDER BY call_date
        ) AS prev_call_date
    FROM callers
)

SELECT COUNT(DISTINCT policy_holder_id) AS policy_holder_count
FROM call_gaps
WHERE call_date - prev_call_date <= INTERVAL '7 days';
