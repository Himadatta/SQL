use pizzahut;

-- Retrieve the total number of orders placed.

SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;

-- Calculate the total revenue generated from pizza sales. 

SELECT 
    ROUND(SUM(pizzas.price * order_details.quantity),
            1) AS total_sales
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id;
    
--     Identify the highest-priced pizza. 

SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price
LIMIT 1;

-- Identify the most common pizza size ordered.

SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;

-- List the top 5 most ordered pizza types along with their quantities.

select pizza_types.name, order_details.quantity from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id join 