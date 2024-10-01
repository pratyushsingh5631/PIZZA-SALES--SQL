-- DETERMINE THE TOP 3 ORDERED PIZZA TYPES BASED ON REVENUE FOR EACH PIZZA CATEGORY

SELECT name, revenue from 
(SELECT category, name, revenue, rank() over(partition by category ORDER BY revenue DESC) as rn
FROM
(SELECT pizza_types.category, pizza_types.name,
SUM((order_details.quantity) * pizzas.price) AS revenue
FROM pizza_types JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category, pizza_types.name) AS a) AS b
where rn <= 3;