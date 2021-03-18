select sum(a.price * b.Quantity) as Spent, b.Country, count(b.Invoice) as Invoices from search a inner join sales b on a.title=b.Title group by Country;

select sum(a.Tot_invoice), a.Country, count(a.Invoice) from (select sum(search.price * sales.Quantity) as Tot_invoice, Invoice, Country 
from sales inner join search on search.title=sales.Title group by Invoice) a group by Country;

select round(sum(a.Tot_invoice)/count(distinct(a.Invoice))) as AOV, Country from 
(select sum(search.price * sales.Quantity) as Tot_invoice, Invoice, Country from sales inner join search on search.title=sales.Title group by Invoice) a 
where Country!= "SteelSeries QcK Gaming Surface - XL RGB Prism Cloth - Best Selling Mouse Pad of All Time - Sized to Cover Desks" group by a.Country order by AOV desc;

# average order value by country
select round(sum(a.Tot_invoice)) as Total, count(distinct(a.Invoice)) as Invoice_number, a.Country, round(round(sum(a.Tot_invoice))/ count(distinct(a.Invoice))) as AOV from 
(select sum(search.price * sales.Quantity) as Tot_invoice, Invoice, Country from sales inner join search on search.title=sales.Title group by Invoice) a 
where Country!= "SteelSeries QcK Gaming Surface - XL RGB Prism Cloth - Best Selling Mouse Pad of All Time - Sized to Cover Desks" and Country !="Germany" group by a.Country order by AOV desc;




