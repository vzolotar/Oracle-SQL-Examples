--Select rows (one order_id - no dups) with latest JOB_DT, EFF_DT, TERM_DT,and max ITEM_ID 

select * from 
(select * , rank() over (partition by ORDER_ID order by JOB_DT desc, EFF_DT desc, TERM_DT desc, ITEM_ID desc) rnk 
from SCHEMA_NAME.TABLE_NAME_T
WHERE EFF_DT < current_date and TERM_DT > current_date ) curr_date
where rnk = 1