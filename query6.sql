--Consulta 6
WITH retrasos
     AS (SELECT f.flight_no,
                ( f.actual_arrival - f.scheduled_arrival ) AS retraso
         FROM   flights f)
SELECT r.flight_no,
       Avg(r.retraso) AS retraso_promedio
FROM   retrasos r
GROUP  BY r.flight_no
HAVING Avg(r.retraso) = (SELECT Max(avg_retraso)
                         FROM   (SELECT Avg(retraso) AS avg_retraso
                                 FROM   retrasos
                                 GROUP  BY flight_no) AS subquery);
