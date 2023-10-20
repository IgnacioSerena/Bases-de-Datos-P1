--Consulta 4
WITH VacantSeats AS (
    SELECT
        flight_id,
        COUNT(*) AS "Asientos Vacíos"
    FROM seats
    GROUP BY flight_id
)
SELECT
    vs.flight_id AS "flight id",
    vs."Asientos Vacíos" AS "Número de Asientos Vacíos"
FROM VacantSeats AS vs
WHERE vs."Asientos Vacíos" = (SELECT MAX("Asientos Vacíos") FROM VacantSeats);