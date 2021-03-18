# top 5 countries generating max revenue
SELECT sales.Country,
    COUNT(distinct(Invoice)) AS Total_Amount_of_Invoice,
    SUM(Quantity) AS Total_Quantity,
    round(SUM(Quantity * search.price),2) AS Total_Revenue
FROM (sales INNER JOIN search ON search.title = sales.Title)
GROUP BY country
ORDER BY Total_Revenue DESC limit 5;

# Quarterly revenue by product type
SELECT product_type, extract(year from invoicedate) AS year, QUARTER(invoicedate) AS quarter, round(sum(sales.quantity*search.price),2) AS revenue
  FROM sales
 inner join search on sales.title = search.title
 GROUP BY search.product_type, year, quarter having product_type is not null
 ORDER BY year, quarter;
 
# total order placed by hour
SELECT 
	hour(invoicedate) AS OnHour,
    COUNT(Invoice) AS Total_Amount_of_Invoice,
    SUM(Quantity) AS Total_Quantity,
    round(SUM(Quantity * search.price),2) AS Total_Revenue
FROM (sales INNER JOIN search ON search.title = sales.Title)
GROUP BY onhour
ORDER BY onhour limit 20 offset 2 ;

# Total order by month
SELECT  
EXTRACT(YEAR FROM InvoiceDate) AS Years,
EXTRACT(MONTH FROM InvoiceDate) AS Month_No,
MONTHNAME(invoicedate) AS Month_Name,
COUNT(Invoice) AS Total_Amount_of_Invoice, 
SUM(Quantity) AS Quantity, 
round(SUM(Quantity * search.price),2) AS Total_Revenue, 
count(distinct sales.customerid) as Total_Unique_Customer
FROM (sales INNER JOIN search ON search.title = sales.Title)
group by years, Month_no having Month_Name is not null
ORDER BY  Month_no ;

# sales by day
SELECT 
    COUNT(Invoice) AS Total_Amount_of_Invoice,
    SUM(Quantity) AS Total_Quantity,
    round(SUM(Quantity * search.price),2) AS Total_Revenue,
    DAYNAME(invoicedate) AS Weekday
FROM (sales INNER JOIN search ON search.title = sales.Title)
GROUP BY Weekday having Weekday is not null
ORDER BY Total_Revenue DESC;

# sales by day
SELECT 
    CAST(InvoiceDate AS DATE) as dates,
    COUNT(Invoice) AS Total_Amount_of_Invoice,
    SUM(Quantity) AS Quantity,
    round(SUM(Quantity * search.price),2) AS revenue
FROM (sales INNER JOIN search ON search.title = sales.Title)
GROUP BY  dates having dates is not null
ORDER BY  dates  ;