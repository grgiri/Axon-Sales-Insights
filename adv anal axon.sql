/* Report for each product, the percentage value of its stock on hand 
as a percentage of the stock on hand for product line to which it belongs. 
 */
 
 with prod_perc as(
 select productLine,sum(quantityInStock) as tot_stock
 from dimproducts 
 group by productLine
 )
 select p.productCode,p.productName,p.productLine,
 round((p.quantityInStock/tot_stock)*100,2)as per_stock
 from dimproducts p 
 join prod_perc pp
 on pp.productLine = p.productLine  
 order by per_stock ;
 
/* Which customers have made the largest payments in total? */
 
 select dc.customerName, sum(dp.amount) as totalPayments
from dimcustomer dc
join dimpayments dp on dc.customerNumber = dp.customerNumber
group by dc.customerName
order by totalPayments desc
limit 5;




/* What is the average order value by product line? */

select pl.productLine, avg(fo.priceEach * fo.quantityOrdered) as avgOrderValue
from productlines pl
join dimproducts dp on pl.productLine = dp.productLine
join factorders fo on fo.productCode = dp.productCode
group by pl.productLine;

/* What is the no of customers and sales by country?*/

select dc.country, COUNT(dc.customerNumber) as NumberOfCustomers,
sum(fo.priceEach * fo.quantityOrdered) as OrderValue
from dimcustomer dc
join factorders fo on fo.customerNumber = dc.customerNumber
group by dc.country
order by NumberOfCustomers desc;

/* Most ordered product ? */
select dp.ProductCode,dp.ProductName,count(fo.OrderNumber) as most_ordered
from dimproducts dp
join factorders fo 
on fo.ProductCode = dp.ProductCode
group by dp.ProductCode,dp.ProductName
order by 3 desc
limit 5;

/*  List the names of products sold at less than 80% of the MSRP. */
select dp.ProductName,fo.MSRP,fo.priceEach 
from dimproducts dp
join factorders fo
on fo.ProductCode = dp.ProductCode
where fo.priceEach < 0.8*fo.MSRP;

/* What is the quantity on hand for products listed on 'On Hold' orders? */

select dp.ProductName,dp.QuantityInStock,fo.Quantityordered 
from dimproducts dp
join factorders fo 
on fo.ProductCode = dp.ProductCode
where fo.status = "On Hold";
 

