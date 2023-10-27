--Consulta 4
WITH emptyseats
     AS (SELECT f.flight_id,
                f.aircraft_code,
                Count(s.seat_no) AS num_empty_seats
         FROM   flights AS f
                LEFT JOIN seats AS s
                       ON f.aircraft_code = s.aircraft_code
                LEFT JOIN ticket_flights AS tf
                       ON f.flight_id = tf.flight_id
         WHERE  tf.ticket_no IS NULL
         GROUP  BY f.flight_id,
                   f.aircraft_code)
SELECT es.flight_id,
       es.num_empty_seats
FROM   emptyseats AS es
WHERE  es.num_empty_seats = (SELECT Max(num_empty_seats)
                             FROM   emptyseats);
