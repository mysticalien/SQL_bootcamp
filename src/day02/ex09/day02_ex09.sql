SELECT DISTINCT person.name
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person.gender = 'female'
  AND menu.pizza_name IN ('pepperoni pizza', 'cheese pizza')
GROUP BY person.name
HAVING COUNT(DISTINCT menu.pizza_name) = 2
ORDER BY person.name;