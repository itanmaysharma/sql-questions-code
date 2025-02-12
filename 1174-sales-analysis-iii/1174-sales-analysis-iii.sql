# Write your MySQL query statement below
-- select DISTINCT P.product_id as product_id, P.product_name as product_name 
-- from Product P JOIN Sales S
-- ON P.product_id = S.product_id 
-- where S.sale_date between '2019-01-01' AND '2019-03-31'
-- AND S.product_id NOT IN (Select product_id from Sales 
-- where sale_date < '2019-01-01' or sale_date > '2019-03-31');

select t1.product_id, t1.product_name 
from Product t1 join Sales t2 on t1.product_id = t2.product_id
group by product_id, product_name
having min(sale_date) >= '2019-01-01' and max(sale_date) <= '2019-03-31'