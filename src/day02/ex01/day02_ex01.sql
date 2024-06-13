SELECT missed_day::date AS missing_date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS missed_day
LEFT JOIN (
    SELECT DISTINCT visit_date::date AS visit_date
    FROM person_visits
    WHERE person_id IN (1, 2)
) AS visits ON missed_day::date = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missed_day::date