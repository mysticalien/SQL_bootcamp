SELECT order_date,
       CONCAT(temp.name, ' (age:', temp.age, ')') AS person_information
FROM person_order
NATURAL JOIN
    (SELECT id AS person_id, name, age FROM person) AS temp
ORDER BY order_date, name;