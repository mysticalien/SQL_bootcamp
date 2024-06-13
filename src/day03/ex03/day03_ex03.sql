SELECT pizzeria_name
FROM (
    SELECT pizzeria.name AS pizzeria_name,
           COUNT(CASE WHEN person.gender = 'female' THEN 1 END) AS visits_by_women,
           COUNT(CASE WHEN person.gender = 'male' THEN 1 END) AS visits_by_men
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
    GROUP BY pizzeria.name
) AS visits_count
WHERE visits_by_women > visits_by_men
   OR visits_by_women < visits_by_men
ORDER BY pizzeria_name;