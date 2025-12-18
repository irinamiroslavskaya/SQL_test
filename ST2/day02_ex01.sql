SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day')::date AS missing_date
EXCEPT
SELECT DISTINCT visit_date
FROM person_visits
WHERE person_id IN (1, 2)
ORDER BY missing_date;