--Consulta 4
WITH EmptySeats AS (
    SELECT
        f.flight_id,
        f.aircraft_code,
        COUNT(s.seat_no) AS num_empty_seats
    FROM
        flights AS f
    LEFT JOIN
        seats AS s ON f.aircraft_code = s.aircraft_code
    LEFT JOIN
        ticket_flights AS tf ON f.flight_id = tf.flight_id
    WHERE
        tf.ticket_no IS NULL
    GROUP BY
        f.flight_id, f.aircraft_code
)

SELECT
    es.flight_id,
    es.num_empty_seats
FROM
    EmptySeats AS es
WHERE
    es.num_empty_seats = (SELECT MAX(num_empty_seats) FROM EmptySeats);
