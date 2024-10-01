-- Join relevent tables to find the catogery-wise distribution of pizzas

SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;