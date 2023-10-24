--Consulta 6
WITH Retrasos AS (
  SELECT
    f.flight_no,
    (f.actual_arrival - f.scheduled_arrival) AS retraso
  FROM
    flights f
)
SELECT
  r.flight_no,
  AVG(r.retraso) AS retraso_promedio
FROM
  Retrasos r
GROUP BY
  r.flight_no
HAVING
  AVG(r.retraso) = (
    SELECT
      MAX(avg_retraso)
    FROM
      (SELECT
        AVG(retraso) AS avg_retraso
      FROM
        Retrasos
      GROUP BY
        flight_no) AS subquery
  );