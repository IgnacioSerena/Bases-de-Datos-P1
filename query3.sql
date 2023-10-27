--Consulta 3
SELECT f.arrival_airport   AS "Código de Aeropuerto",
       Count(bp.ticket_no) AS "Número de Pasajeros Recibidos"
FROM   flights AS f
       LEFT JOIN boarding_passes AS bp
              ON f.flight_id = bp.flight_id
GROUP  BY f.arrival_airport
ORDER  BY "Número de Pasajeros Recibidos" ASC;
