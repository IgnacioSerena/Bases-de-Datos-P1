--Consulta 1
WITH ReservasIdaVuelta AS (
  SELECT
    b.book_ref,
    t.ticket_no,
    f1.departure_airport AS aeropuerto_salida,
    f2.arrival_airport AS aeropuerto_llegada
  FROM
    bookings b
    JOIN tickets t ON b.book_ref = t.book_ref
    JOIN ticket_flights tf1 ON t.ticket_no = tf1.ticket_no
    JOIN flights f1 ON tf1.flight_id = f1.flight_id
    JOIN ticket_flights tf2 ON t.ticket_no = tf2.ticket_no
    JOIN flights f2 ON tf2.flight_id = f2.flight_id
  WHERE
    f1.scheduled_departure = (SELECT MIN(scheduled_departure) FROM flights WHERE flight_id = tf1.flight_id)
    AND f2.scheduled_arrival = (SELECT MAX(scheduled_arrival) FROM flights WHERE flight_id = tf2.flight_id)
    AND f1.departure_airport = f2.arrival_airport
)
SELECT
  riv.aeropuerto_salida AS codigo_aeropuerto,
  COUNT(DISTINCT rv.book_ref) AS num_reservas
FROM
  ReservasIdaVuelta riv
GROUP BY
  riv.aeropuerto_salida;