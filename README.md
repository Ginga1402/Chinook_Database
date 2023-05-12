# Chinook_Database
## Solved using Microsoft SQL Server Management Studio

### The Chinook data model represents a digital media store, including tables for artists, albums, media tracks, invoices, and customers.

● Media-related data was created using real data from an Apple iTunes library.

● Customer and employee information was created using fictitious names and addresses that can be located on Google maps, and other well formatted data (phone, fax, email, etc.)

● Sales information was auto generated using random data for a four-year period.

### The Chinook sample database includes:

● 11 tables

● A variety of indexes, primary and foreign key constraints

● Over 15,000 rows of data


![ezgif com-rotate (1)](https://github.com/Ginga1402/Chinook_Database/assets/130181481/d93fc1a3-8d2e-457c-8bc7-aa81e5f42bb7)

## Table Information:

* The employee table contains information about employees, such as their names, titles, and contact information. Each employee has a unique EmployeeId.

* The customer table contains information about customers, such as their names, addresses, and contact information. Each customer has a unique CustomerId. The SupportRepId column is a foreign key that refers to the EmployeeId of the employee who provides support to that customer.

* The invoice table contains information about invoices, such as the date and total amount of the invoice, as well as the customer who placed the order. Each invoice has a unique InvoiceId. The CustomerId column is a foreign key that refers to the CustomerId of the customer who placed the order.

* The invoiceline table contains information about each line item on an invoice, including the track that was purchased, the unit price, and the quantity. Each line item has a unique InvoiceLineId. The InvoiceId column is a foreign key that refers to the InvoiceId of the invoice that the line item belongs to. The TrackId column is a foreign key that refers to the TrackId of the track that was purchased.

* The track table contains information about each track in the Chinook music catalog, including the name, length, and genre. Each track has a unique TrackId. The AlbumId column is a foreign key that refers to the AlbumId of the album that the track belongs to. The MediaTypeId and GenreId columns are foreign keys that refer to the MediaTypeId and GenreId of the media type and genre associated with the track, respectively.

* The album table contains information about each album, including the title and the artist who created it. Each album has a unique AlbumId. The ArtistId column is a foreign key that refers to the ArtistId of the artist who created the album.

* The artist table contains information about each artist in the Chinook music catalog, including the name. Each artist has a unique ArtistId.

* The genre table contains information about each genre in the Chinook music catalog, including the name. Each genre has a unique GenreId.

* The MediaType table contains information about each type of media in the Chinook music catalog, including the name. Each media type has a unique MediaTypeId.

* The Playlist table contains information about each playlist in the Chinook music catalog, including the name. Each playlist has a unique PlaylistId.

* The PlaylistTrack table contains information about the tracks included in each playlist. Each row in the table represents a single track in a single playlist. The PlaylistId and TrackId columns are foreign keys that refer to the PlaylistId and TrackId of the playlist and track associated with the row, respectively.

## ER-Diagram:

![image](https://github.com/Ginga1402/Chinook_Database/assets/130181481/07be5915-1eec-47ba-8f1e-6527ddeea1fa)

## Questions:

1. Calculate Monthly-Wise invoice Sales and sort them in descending order. (12 rows)

2. Write an SQL query to fetch the names of all employees and their managers. (7 rows)

3. Find the names of customers who have made a purchase in the USA? (13 rows)

4. Show the name of each genre and the total number of tracks in that genre. (25 rows)

5. Show the name of each customer and the total amount they have spent on purchases. (59 rows)

6. Find the name of the album with the highest unit price. (1 row)

7. Display the percentage of missing values for “billingstate” and “billingpostalcode” columns respectively for the invoice table. (1 row)

8. Show the name of each track and the total number of times it has been purchased. (100 rows)

9. Find the name of the customer who has made the largest purchase in terms of total cost. (1 row)

10. Display the total amount spent by each customer and the number of invoices they have. (59 rows)

Note: calculate the total amount spent and the number of invoices for each customer.

11. Find the name of the artist who has the most tracks in the chinook database. (1 row)

12. Find the names and email addresses of customers who have spent more than the average amount on invoices. (59 rows)

13. List the names of all the artists that have tracks in the 'Rock' genre. (51 rows)
