# best 3 selling product per product

SELECT ASIN, title, rating, review_count, price, product_type, rn
FROM 
  ( SELECT ASIN , title, rating, review_count, price, product_type,
           ROW_NUMBER() OVER (PARTITION BY product_type
                              ORDER BY review_count desc,  rating DESC 
                             )
             AS rn
    FROM search
  ) tmp 
WHERE rn <= 3 and product_type is not null
ORDER BY product_type, rn ;