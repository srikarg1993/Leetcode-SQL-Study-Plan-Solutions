-- # Write your MySQL query statement below
# Write your MySQL query statement below
select log_start.log_id as START_ID, min(log_end.log_id) as END_ID from 
    (select log_id from logs where log_id - 1 not in (select * from Logs)) log_start,
    (select log_id from logs where log_id + 1 not in (select * from Logs)) log_end
    where log_start.log_id <= log_end.log_id
    group by log_start.log_id;