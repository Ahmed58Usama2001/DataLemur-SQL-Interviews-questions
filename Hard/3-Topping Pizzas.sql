select 
CONCAT(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name) AS pizza,
  p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
FROM pizza_toppings  as p1
CROSS JOIN
pizza_toppings as p2,
pizza_toppings as p3
where p1.topping_name < p2.topping_name 
and p2.topping_name < p3.topping_name 
order BY total_cost desc, pizza