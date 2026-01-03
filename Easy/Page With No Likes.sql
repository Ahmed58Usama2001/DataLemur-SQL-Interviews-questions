with liked_pages 
AS(select page_id 
from page_likes
)



SELECT page_id
FROM pages
where page_id Not In (select page_id from liked_pages)
order by page_id
