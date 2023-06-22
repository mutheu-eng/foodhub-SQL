-- show the database
SELECT *
FROM `foodhub-order`;


-- SHOW THE NUMBER OF ROWS
SELECT COUNT(*)
FROM `foodhub-order`;

-- THE DATASET IS CLEAN: STATISTICAL SUMMARY; MIN, MAX, AVG FOR THE FOOD TO BE PREPARED.
SELECT MAX(food_preparation_time)
FROM `foodhub-order`;

SELECT MIN(food_preparation_time)
FROM `foodhub-order`;

SELECT ROUND(AVG(food_preparation_time),2)
FROM `foodhub-order`;

-- HOW MANY ORDERS ARE NOT RATED - 736
SELECT COUNT(order_id)
FROM `foodhub-order`
WHERE rating = 'Not Given';

-- Top 5 resturants in terms of orders
SELECT restaurant_name, ROUND(SUM(cost_of_the_order),2) AS total_cost_orders
FROM `foodhub-order`
GROUP BY restaurant_name
ORDER BY total_cost_orders DESC
limit 5;

-- Which is the most popular cuisine on weekends
SELECT cuisine_type, COUNT(*) as order_count
FROM `foodhub-order`
WHERE day_of_the_week IN ('Saturday', 'Sunday')
GROUP BY cuisine_type
ORDER BY order_count DESC
LIMIT 1;

-- What is the mean order delivery time?
SELECT ROUND(AVG(delivery_time) ,2)
FROM `foodhub-order`;

-- TOP 3 CUSTOMERS FREQUENT CUSTOMERS- THEY WILL RECEIVE 20% DISCOUNT
SELECT customer_id, COUNT(order_id) AS Number_of_Orders
FROM `foodhub-order`
GROUP BY customer_id
ORDER BY Number_of_Orders DESC
LIMIT 3;

-- PROMOTIONAL OFFER FOR RESTARAUNTS THAT HAVE A COUNT RATING OF 50 
SELECT restaurant_name, COUNT(rating) AS Number_of_rating,AVG(rating) AS Average_Rating
FROM `foodhub-order`
GROUP BY restaurant_name
HAVING Number_of_rating > 50 AND Average_Rating > 4;

-- PROMOTIONAL OFFER FOR RESTARAUNTS THAT HAVE AN AVERAGE RATING  OF 4 
SELECT restaurant_name,ROUND(AVG(rating) , 2) AS Average_Rating, COUNT(rating) AS Number_of_rating
FROM `foodhub-order`
GROUP BY restaurant_name
HAVING Average_Rating > 4 AND Number_of_rating > 50;

-- The company charges the restaurant 25% on the orders having cost greater than 20 dollars. 555
SELECT restaurant_name, cost_of_the_order
FROM `foodhub-order`
WHERE cost_of_the_order > 20;

-- 15% on the orders having cost greater than 5 dollars. 1189
SELECT restaurant_name, cost_of_the_order
FROM `foodhub-order`
WHERE cost_of_the_order > 5;

-- ORDERS THAT TAKE MORE 60 MINUTES : 200
SELECT Time_taken
FROM (
 SELECT restaurant_name, (delivery_time + food_preparation_time) AS Time_taken
 FROM `foodhub-order`
 ) AS dt
WHERE  Time_taken > 60;

-- The company wants to analyze the delivery time of the orders on weekdays - 1351
SELECT day_of_the_week, count(day_of_the_week) AS Number_of_days
FROM `foodhub-order`
GROUP BY day_of_the_week
HAVING day_of_the_week = 'weekend';

-- The company wants to analyze the delivery time of the orders on weekdays -547
SELECT day_of_the_week, count(day_of_the_week) AS Number_of_days
FROM `foodhub-order`
GROUP BY day_of_the_week
HAVING day_of_the_week = 'weekday';









