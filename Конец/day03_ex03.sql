SELECT
    pz.name AS pizzeria_name
FROM (
    SELECT 
        pv.pizzeria_id,
        p.gender
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
) AS visits_gender
JOIN pizzeria pz ON visits_gender.pizzeria_id = pz.id
GROUP BY pz.name
HAVING COUNT(DISTINCT CASE WHEN gender = 'female' THEN 1 END) != 
       COUNT(DISTINCT CASE WHEN gender = 'male' THEN 1 END)
ORDER BY pz.name;