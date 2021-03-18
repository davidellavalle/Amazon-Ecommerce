# top 3 generating Revenue product 
select Asin, Title, Revenue, product_type, top3 from 
(select Asin, Title, Revenue, product_type,
row_number() over(partition by product_type order by Revenue desc) as top3
from
(SELECT 
    se.Asin,
    s.Title,
    se.price,
    SUM(s.Quantity),
    round(SUM(s.Quantity * se.price),1) AS Revenue,
    se.product_type,
    Invoicedate
FROM
    sales s
        INNER JOIN
    search se ON se.title = s.Title
GROUP BY s.Title
HAVING product_type IS NOT NULL and extract(year from Invoicedate) = 2019
ORDER BY Revenue DESC) tmp1) tmp2
where top3 <= 3;