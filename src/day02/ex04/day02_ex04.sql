SELECT
    menu.pizza_name,
    p.name AS pizzeria_name,
    menu.price
FROM menu
JOIN pizzeria p ON menu.pizzeria_id = p.id
WHERE menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY menu.pizza_name, p.name;