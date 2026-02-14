WITH cte AS (
  SELECT
    user_id,
      DATE_TRUNC('year', filing_date) AS current_year,
      LAG(DATE_TRUNC('year', filing_date)) OVER (
        PARTITION BY user_id 
        ORDER BY filing_date) AS previous_year,
      LEAD(DATE_TRUNC('year', filing_date)) OVER (
        PARTITION BY user_id 
        ORDER BY filing_date) AS following_year
  FROM filed_taxes
  WHERE LOWER(product) LIKE 'turbotax%'
)

SELECT distinct user_id
FROM cte
WHERE previous_year = current_year - interval '1 year'
  AND following_year = current_year + interval '1 year'

