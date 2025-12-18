WITH days_series AS (
    SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day')::date AS day
)
SELECT day AS missing_date
FROM days_series
LEFT JOIN person_visits 
    ON days_series.day = person_visits.visit_date
    AND person_visits.person_id IN (1, 2)
WHERE person_visits.visit_date IS NULL
ORDER BY missing_date;