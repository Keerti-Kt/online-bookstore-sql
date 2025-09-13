SELECT
	*
FROM
	BOOKS;

SELECT
	*
FROM
	ORDERS;

SELECT
	*
FROM
	CUSTOMERS;
	

-- : Retrieve all books in the "Fiction" genre.
SELECT
	*
FROM
	BOOKS
WHERE
	GENRE = 'Fiction';
	

-- : Find books published after the year 1950.
SELECT
	*
FROM
	BOOKS
WHERE
	PUBLISHED_YEAR > 1950;
	

-- : List all customers from the canada.
SELECT
	*
FROM
	CUSTOMERS
WHERE
	COUNTRY = 'Canada';
	

-- : Show orders placed in November 2023.
SELECT
	*
FROM
	ORDERS
WHERE
	ORDER_DATE BETWEEN '2023-11-01' AND '2023-11-30';
	

-- : Retrieve the total stock of books available.
SELECT
	SUM(STOCK) AS TOTAL_AVAILABLE_BOOKS
FROM
	BOOKS;
	

-- : Find the details of the most expensive book.
SELECT
	*
FROM
	BOOKS
ORDER BY
	PRICE DESC
LIMIT
	1;
	

-- : Show all customers who ordered more than 1 quantity of a book.
SELECT
	*
FROM
	ORDERS
WHERE
	QUANTITY > 1;
	

-- : Retrieve all orders where the total amount exceeds $20.
SELECT
	*
FROM
	ORDERS
WHERE
	TOTAL_AMOUNT > 20;
	

-- : List all genres available in the Books table.
SELECT DISTINCT
	GENRE
FROM
	BOOKS;
	

-- : Find the book with the lowest stock.
SELECT
	*
FROM
	BOOKS
ORDER BY
	STOCK ASC
LIMIT
	1;
	

-- : Calculate the total revenue generated from all orders.
SELECT
	SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE_GENERATED
FROM
	ORDERS;
	

-- ADVANCE QUERIES.


-- : Retrieve the total number of books sold for each genre.
SELECT
	B.GENRE,
	SUM(O.QUANTITY) AS TOTAL_BOOK_SOLD
FROM
	ORDERS O
	JOIN BOOKS B ON O.BOOK_ID = B.BOOK_ID
GROUP BY
	B.GENRE;
	

-- : Find the average price of books in the "Fantasy" genre.
SELECT
	AVG(PRICE) AS AVG_PRICE_OF_FANTASY_BOOKS
FROM
	BOOKS
WHERE
	GENRE = 'Fantasy';
	

-- : List customers who have placed atleast 2 orders.
SELECT
	O.CUSTOMER_ID,
	C.NAME,
	COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM
	ORDERS O
	JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY
	O.CUSTOMER_ID,
	C.NAME
HAVING
	COUNT(ORDER_ID) >= 2;
	

-- : Find the most frequently ordered book.
SELECT
	O.BOOK_ID,
	B.TITLE,
	COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM
	ORDERS O
	JOIN BOOKS B ON O.BOOK_ID = B.BOOK_ID
GROUP BY
	O.BOOK_ID,
	B.TITLE
ORDER BY
	ORDER_COUNT DESC
LIMIT
	1;
	

-- : Show the top 3 most expensive books of 'Fantasy' genre.
SELECT
	*
FROM
	BOOKS
WHERE
	GENRE = 'Fantasy'
ORDER BY
	PRICE DESC
LIMIT
	3;
	

-- : Retrieve the total quantity of books sold by each author.
SELECT
	B.AUTHOR,
	SUM(O.QUANTITY) AS TOTAL_QUANTITY_SOLD
FROM
	ORDERS O
	JOIN BOOKS B ON O.BOOK_ID = B.BOOK_ID
GROUP BY
	B.AUTHOR;
	

-- : List the cities where customers who spent over $30 are located.
SELECT DISTINCT
	C.CITY,
	TOTAL_AMOUNT
FROM
	ORDERS O
	JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE
	O.TOTAL_AMOUNT > 30;
	

-- : Find the customer who spent the most on orders.
SELECT
	C.CUSTOMER_ID,
	C.NAME,
	SUM(O.TOTAL_AMOUNT) AS TOTAL_SPENT
FROM
	ORDERS O
	JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY
	C.NAME,
	C.CUSTOMER_ID
ORDER BY
	TOTAL_SPENT DESC
LIMIT
	1;
	

-- : Calculate the remaining stock after fulfilling all orders.
SELECT
	B.BOOK_ID,
	B.TITLE,
	B.STOCK,
	COALESCE(SUM(O.QUANTITY), 0) AS ORDER_QUANTITY,
	B.STOCK - COALESCE(SUM(O.QUANTITY), 0) AS REMAINING_STOCK
FROM
	BOOKS B
	LEFT JOIN ORDERS O ON B.BOOK_ID = O.BOOK_ID
GROUP BY
	B.BOOK_ID
ORDER BY
	B.BOOK_ID;