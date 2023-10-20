--Consulta 6
SELECT
    f.flight_no AS "flight no",
    AVG(EXTRACT(EPOCH FROM (f.actual_arrival - f.scheduled_arrival))) AS "Retraso Medio"
FROM flights AS f
GROUP BY f.flight_no
HAVING AVG(EXTRACT(EPOCH FROM (f.actual_arrival - f.scheduled_arrival))) = (
    SELECT MAX(avg_delay)
    FROM (
        SELECT flight_no, AVG(EXTRACT(EPOCH FROM (actual_arrival - scheduled_arrival))) AS avg_delay
        FROM flights
        GROUP BY flight_no
    ) AS Subquery
);