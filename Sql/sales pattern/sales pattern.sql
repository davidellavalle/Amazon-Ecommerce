# pattern by day
SELECT 
    COUNT(Invoice),
    SUM(Quantity),
    SUM(Quantity * search.price) AS revenue,
    DATE(InvoiceDate) AS I_date
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
GROUP BY I_date
ORDER BY revenue DESC;

# Purchase frequency by customer of product type
SELECT 
    search.product_type AS Product_Type,
    EXTRACT(YEAR FROM InvoiceDate) AS Years,
    MONTHNAME(invoicedate) AS Month_Name,
    COUNT(distinct(Invoice)) AS Total_Amount_of_Invoice,
    COUNT(DISTINCT sales.customerid) AS Total_Unique_Customer,
    round(COUNT(distinct(Invoice)) / COUNT(DISTINCT(sales.customerid)),2) AS Purchase_Frequency
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
GROUP BY years , Month_Name , product_type having product_type is not null
ORDER BY Purchase_Frequency desc
LIMIT 200 OFFSET 9;

# list of items bought on "2019-10-07" - day when revenue was the highest
SELECT 
    sales.Title, Quantity, DATE(InvoiceDate) AS I_date, Invoice
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
WHERE
    DATE(InvoiceDate) = '2019-10-07'
ORDER BY Quantity DESC;
# check on first 2 invoices to make sure previous code is working fine
SELECT 
    *
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
WHERE
    Invoice = '78570094';
SELECT 
    *
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
WHERE
    Invoice = '78570097';

# list of Customer ID on "2019-10-07" - day when revenue was the highest
SELECT 
    SUM(Quantity * price), CustomerID
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
WHERE
    DATE(InvoiceDate) = '2019-10-07'
GROUP BY sales.CustomerID
ORDER BY SUM(Quantity * price) DESC;

# per customerID spent
SELECT 
    SUM(Quantity * price), CustomerID
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
GROUP BY sales.CustomerID
ORDER BY SUM(Quantity * price) DESC;

# wholesaler buying from DE
SELECT 
    Invoice, SUM(Quantity), InvoiceDate, Country
FROM
    sales
WHERE
    CustomerId = '14646.0'
GROUP BY InvoiceDate
ORDER BY InvoiceDate;
SELECT 
    Invoice, SUM(Quantity), InvoiceDate, Country
FROM
    sales
WHERE
    CustomerId = '17306.0'
GROUP BY InvoiceDate
ORDER BY InvoiceDate;
SELECT 
    Invoice, SUM(Quantity), InvoiceDate, Country
FROM
    sales
WHERE
    CustomerId = '17381.0'
GROUP BY InvoiceDate
ORDER BY InvoiceDate;
SELECT 
    Invoice, SUM(Quantity), InvoiceDate, Country
FROM
    sales
WHERE
    CustomerId = '12415.0'
GROUP BY InvoiceDate
ORDER BY InvoiceDate;

# pattern by month
SELECT 
    COUNT(Invoice),
    SUM(Quantity) AS Quantity,
    SUM(Quantity * search.price) AS revenue,
    EXTRACT(MONTH FROM InvoiceDate) AS months,
    EXTRACT(YEAR FROM InvoiceDate) AS years
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
GROUP BY months , years
ORDER BY months;

# pattern by week
SELECT 
    COUNT(Invoice),
    SUM(Quantity) AS Quantity,
    SUM(Quantity * search.price) AS revenue,
    EXTRACT(WEEK FROM InvoiceDate) AS weeks,
    EXTRACT(YEAR FROM InvoiceDate) AS years
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
GROUP BY weeks , years
ORDER BY years , weeks;

# Is there any specific day when the sales have been unusually high / low and what could be the possible reasons ? 
(SELECT 
    DATE(InvoiceDate) AS s_date,
    ROUND(SUM(sales.Quantity * search.price), 1) AS revenue
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
GROUP BY s_date
ORDER BY revenue DESC
LIMIT 3) UNION (SELECT 
    DATE(InvoiceDate) AS s_date,
    ROUND(SUM(sales.Quantity * search.price), 1) AS revenue
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
GROUP BY s_date
HAVING s_date IS NOT NULL
ORDER BY revenue ASC
LIMIT 3);

# all invoices containing that invoice id, result just negative invoices
SELECT 
    *
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
WHERE
    Invoice LIKE '%78564940%';
# works with partial invoice id as well
SELECT 
    *
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
WHERE
    Invoice LIKE '%64940%';
# no positive invoice
SELECT 
    *
FROM
    (sales
    INNER JOIN search ON search.title = sales.Title)
WHERE
    Invoice LIKE '78564940';