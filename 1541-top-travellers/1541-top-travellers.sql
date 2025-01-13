# Write your MySQL query statement below
-- select U.name as name, SUM(CASE WHEN R.distance IS NOT NULL THEN R.distance ELSE 0 END) as travelled_distance
-- from Users U LEFT JOIN Rides R 
-- ON U.id = R.user_id
-- GROUP BY U.name
-- ORDER BY travelled_distance DESC, U.name ASC;

select U.name as name, COALESCE(SUM(R.distance),0) as travelled_distance
from Users U LEFT JOIN Rides R 
ON U.id = R.user_id
GROUP BY U.id,U.name
ORDER BY travelled_distance DESC, U.name ASC;

