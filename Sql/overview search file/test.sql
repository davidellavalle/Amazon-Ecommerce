# Avg rating by product type
SELECT 
    product_type, AVG(rating), AVG(review_count)
FROM
    search
GROUP BY product_type having product_type is not null
ORDER BY AVG(review_count) DESC , AVG(rating) DESC;
select * from monitor;

# Top 10 brands smartphone
SELECT 
    Manufacturer, AVG(rating) AS ar, SUM(review_count) AS rc
FROM
    search,
    smartphone
WHERE
    search.ASIN = smartphone.ASIN
GROUP BY Manufacturer having Manufacturer is not null
ORDER BY rc DESC , ar DESC
LIMIT 10;

# top 5 brand laptop

SELECT 
    COALESCE(Brand, '') AS Manufacturer,
    AVG(rating) AS rating,
    SUM(review_count) AS rc
FROM
    search,
    laptop
WHERE
    search.ASIN = laptop.ASIN
GROUP BY Brand
ORDER BY rc DESC , rating DESC
LIMIT 5;

select a.Manufacturer, sum(a.review_count), avg(a.rating)  from
(select h.Manufacturer, h.ASIN, s.rating, s.review_count from smartphone h left join search s on s.ASIN = h.ASIN 
where product_type="smartphone") a
group by Manufacturer order by review_count desc, rating desc limit 10;
