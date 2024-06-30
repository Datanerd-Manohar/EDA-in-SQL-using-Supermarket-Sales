#CREATE DATABASE supermarket;

#SELECT * FROM supermarket_sales;

#----What is the total sales amount for each city?----
SELECT City, SUM(Total) AS TotalSalesAmount
FROM supermarket_sales
GROUP BY City
ORDER BY TotalSalesAmount;

#----What is the average customer rating for each product line?----
SELECT 'Product line', AVG(Rating) AS OverAllRating
FROM supermarket_sales
GROUP BY 'Product line'
ORDER BY OverAllRating;

#----What is the total sales amount for each payment method?----
SELECT Payment, sum(Total) as TotalPaymentViaMethods
FROM supermarket_sales
GROUP BY Payment
ORDER BY TotalPaymentViaMethods desc;

#----What are the top 5 transactions with the highest gross income?----
SELECT `Invoice ID`, `Branch`, `City`, `Product line`, `Total`, `gross income`
FROM supermarket_sales
ORDER BY `gross income` DESC
LIMIT 5;

#----What is the total sales amount for each gender and customer type combination?----
SELECT Gender, `Customer type`, SUM(Total) AS Total_Sales
FROM supermarket_sales
GROUP BY Gender, `Customer type`;

#----What is the monthly sales trend?----
SELECT DATE_FORMAT(STR_TO_DATE(DATE, '%d/%m/%Y'), '%Y-%m') AS Month, SUM(Total) AS TotalAmount
FROM supermarket_sales
GROUP BY Month
ORDER BY Month;

#----What is the average quantity sold for each product line?----
SELECT `Product line`, AVG(Quantity) AS AvgQunatitySold
FROM supermarket_sales
GROUP BY `Product line`
ORDER BY AvgQunatitySold;

#----What is the total sales and average rating for each branch?----
SELECT Branch, SUM(Total) AS TotalAmount, AVG(Rating) AS AvgRating
FROM supermarket_sales
GROUP BY Branch
ORDER BY TotalAmount;

#----What is the total sales for members versus normal customers?----
SELECT `Customer type`, SUM(Total) AS Total_Amount
FROM supermarket_sales
GROUP BY `Customer type`;

#---What is the total amount generated from each city based on Product line and gender----
SELECT City, `Product line`,Gender, SUM(Total) AS Total
FROM supermarket_sales
GROUP BY `Product line`,City, Gender
ORDER BY Total DESC;

#----Which mode of payment made highest sales in each city----
SELECT City, Payment, SUM(Total) AS Total 
FROM supermarket_sales
GROUP BY City, Payment
ORDER BY Total DESC;

#----How many units of Product line are sold and what is the total amount made by each Product line----
SELECT `Product line`, City, SUM(`Unit price`) AS Sum_Units_Sold, SUM(Total) AS TotalAmount
FROM supermarket_sales
GROUP BY `Product line`, City
ORDER BY TotalAmount DESC