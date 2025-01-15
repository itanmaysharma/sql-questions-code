# Write your MySQL query statement below
-- select T.request_at, ROUND( SUM(CASE WHEN T.status != 'completed' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 100, 2) as CancellationRate
-- from Trips T
-- LEFT JOIN Users U ON T.client_id = U.users_id OR T.driver_id = U.users_id
-- WHERE
-- U.banned = 'No' AND T.request_at BETWEEN '2013-10-01' and '2013-10-03'
-- GROUP BY
-- T.request_at

SELECT 
    T.request_at as Day, 
    ROUND(SUM(CASE WHEN T.status NOT IN ('completed') THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 2) AS `Cancellation Rate`
FROM 
    Trips T
JOIN 
    Users U1 ON T.client_id = U1.users_id AND U1.banned = 'No'
JOIN 
    Users U2 ON T.driver_id = U2.users_id AND U2.banned = 'No'
WHERE 
    T.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 
    T.request_at
ORDER BY
    T.request_at ASC;