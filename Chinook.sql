--Q1) Calculate Monthly-Wise invoice Sales and sort them in descending order. (12 rows)

select MONTH(InvoiceDate) as Months,sum(Total) as total_sales from invoice$ group by MONTH(InvoiceDate);

--Q2) Write an SQL query to fetch the names of all employees and their managers. (7 rows)

select CONCAT(employee$.FirstName,' ',employee$.LastName) as Employee_name, CONCAT(e.FirstName,' ',e.LastName) as Reports_to from employee$ inner Join employee$ e on employee$.ReportsTo = e.EmployeeId;

--Q3) Find the names of customers who have made a purchase in the USA? (13 rows)

select * from customer$ where Country = 'USA';

--Q4) Show the name of each genre and the total number of tracks in that genre. (25 rows)

select * from genre$ 
--select GenreId,COUNT(GenreId) from track$ group by GenreId
--select track$.Name,track$.GenreId,genre$.Name from track$ left join genre$ on track$.GenreId = genre$.GenreId group by genre$.Name

select genre$.Name,count(genre$.GenreId) as Total_tracks from track$ left join genre$ on track$.GenreId = genre$.GenreId group by genre$.Name;

--Q5) Show the name of each customer and the total amount they have spent on purchases. (59 rows)

select * from customer$;
select * from invoice$ ;
select distinct CustomerId from invoice$;

--select i.InvoiceId,i.CustomerId,c.FirstName,c.LastName,i.Total from invoice$ i left join customer$ c on i.CustomerId = c.CustomerId  
select i.CustomerId,CONCAT(c.FirstName,' ',c.LastName) as customer_name,sum(i.Total) as total_purchase from invoice$ i left join customer$ c on i.CustomerId = c.CustomerId  group by i.CustomerId, CONCAT(c.FirstName,' ',c.LastName);

--Q6) Find the name of the album with the highest unit price. (1 row)


select * from album$;
select * from track$ ;
select * from track$ order by UnitPrice desc;
select album$.AlbumId,album$.Title,track$.UnitPrice from track$ left join album$ on track$.AlbumId = album$.AlbumId order by track$.UnitPrice desc offset 0 rows fetch first 1 rows only;

--Q7)  Display the percentage of missing values for “billingstate” and “billingpostalcode” columns respectively for the invoice table. (1 row)

select * from invoice$;
select * from invoice$ where BillingState is null and BillingPostalCode is null;
select * from invoice$ where BillingPostalCode is null;

update invoice$
set BillingState = nullif(BillingState,'') where BillingState = '';
update invoice$
set BillingPostalCode = nullif(BillingPostalCode,'') where BillingPostalCode = '';

SELECT 100.0 * SUM ( CASE WHEN BillingState IS NULL THEN 1 ELSE 0 END) / COUNT (*) AS BillingState_Null_Percent, 100.0 * SUM ( CASE WHEN BillingPostalCode IS NULL THEN 1 ELSE 0 END) / COUNT (*) AS BillingPostalCode_Percent FROM invoice$;


--Q8)  Show the name of each track and the total number of times it has been purchased. (100 rows)

select * from track$;
select * from invoiceline$;
select distinct(Quantity) from invoiceline$;
select distinct(track$.name),COUNT(invoiceline$.InvoiceLineId) as No_of_times from track$ left join invoiceline$ on track$.TrackId = invoiceline$.InvoiceId group by track$.TrackId,track$.Name having COUNT(invoiceline$.InvoiceLineId )> 0;

--Q9) Show the name of each track and the total number of times it has been purchased. (100 rows)

select * from customer$;
select * from invoice$;
select customer$.CustomerId,CONCAT(FirstName,' ',LastName) as Customer_name,sum(invoice$.Total) as Total_purchases from customer$ left join invoice$ on customer$.CustomerId = invoice$.InvoiceId group by customer$.CustomerId,CONCAT(FirstName,' ',LastName) order by sum(invoice$.Total) desc  offset 0 rows fetch first 1 rows only;

--Q10) Display the total amount spent by each customer and the number of invoices they have. (59 rows)
--Display the total amount spent by each customer and the number of invoices they have. (59 rows)

select customer$.CustomerId,CONCAT(FirstName,' ',LastName) as Customer_name,sum(invoice$.Total) as total_amt_spent, count(invoice$.InvoiceId) as Total_no_of_times from customer$ left join invoice$ on customer$.CustomerId = invoice$.CustomerId group by customer$.CustomerId,CONCAT(FirstName,' ',LastName);

--Q11) Display the total amount spent by each customer and the number of invoices they have. (59 rows)

select * from track$;
select * from album$;
select * from artist$;

select artist$.ArtistId,artist$.Name,COUNT(track$.TrackId) as no_of_tracks from track$ left join album$ on track$.AlbumId = album$.AlbumId left join artist$ on album$.ArtistId = artist$.ArtistId group by artist$.ArtistId,artist$.Name order by COUNT(track$.TrackId) desc offset 0 rows fetch first 1 rows only;

--Q12) Find the names and email addresses of customers who have spent more than the average amount on invoices. (59 rows)

 select * from customer$;
 select AVG(Total) Avg_Amount from invoice$ ;

select distinct(CONCAT(FirstName,' ',LastName)) full_name,Email from customer$ left JOIN invoice$ on customer$.CustomerId = invoice$.CustomerId where invoice$.Total > (select avg(Total) from invoice$)

--Q13) List the names of all the artists that have tracks in the 'Rock' genre. (51 rows)

select top(1)* from genre$
select top(1)* from artist$
select top(1)* from track$
select top(1)* from album$

select art.Name from track$ t left join genre$ g on t.GenreId= g.GenreId left join album$ alb on t.AlbumId = alb.AlbumId left join artist$ art on alb.ArtistId = art.ArtistId where g.Name = 'Rock' GROUP by art.Name