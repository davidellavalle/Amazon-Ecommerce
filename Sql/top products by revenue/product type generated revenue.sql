use amazon;

select count(*) from sales; # 541909 products
describe sales; # 8 columns Invoice, StockCode, Title, Quantity, InvoiceDate, UnitPrice, CustomerID, Country

select count(*) from search; # 24404 products
describe search; # 6 columns ASIN, title, price, rating, review_count, product_type

# check on sum of null values - price, title, UnitPrice
# 433025 price
# 1454 Title
# 1252 UnitPrice

select sum(isnull(a.UnitPrice)) from (select s.Title, s.Quantity, s.Invoice, s.UnitPrice, search.price, search.product_type from sales s left join search on s.Title = search.title)a;


# the 2 tables can be joined through the title. 
# A lot of data will be lost but considering the low amount of unique items in the table sales the loss is acceptable


# unique title in sales are 914
select count(distinct a.title) from (select s.Title from sales s inner join search on s.Title = search.title) a;

# running inner join - 292347 results
select count(s.Title) from sales s inner join search on s.Title = search.title;

# ANSWER top products in generated revenue

select b.product_type, sum(b.revenue) as total_revenue from
(select a.product_type, a.ASIN, a.Title, (a.price * a. Quantity) as revenue from
(select s.Title, s.Quantity, s.Invoice, search.price, search.product_type, search.ASIN from sales s inner join search on s.Title = search.title) a)b
group by b.product_type order by total_revenue desc limit 10;



select * from search where Title like "Intel Core i7-8700K Desktop Processor 6 Cores up to 4.7GHz Turbo Unlocked LGA1151 300 Series 95W";

