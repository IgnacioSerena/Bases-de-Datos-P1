--Consulta 1
SELECT
    f.departure_airport AS "Código del Aeropuerto de Salida",
    COUNT(b.book_ref) AS "Número de Reservas"
FROM flights AS f
JOIN (
    SELECT
        tf.ticket_no,
        tf.flight_id,
        MIN(f.scheduled_departure) AS first_departure,
        MAX(f.scheduled_arrival) AS last_arrival
    FROM ticket_flights AS tf
    JOIN flights AS f ON tf.flight_id = f.flight_id
    GROUP BY tf.ticket_no
) AS subquery ON f.scheduled_departure = subquery.first_departure
           AND f.scheduled_arrival = subquery.last_arrival
JOIN ticket_flights AS tf ON f.flight_id = tf.flight_id
JOIN bookings AS b ON tf.ticket_no = b.book_ref
GROUP BY f.departure_airport
ORDER BY f.departure_airport;