--Consulta 5
SELECT
    b.book_ref AS "book ref",
    tf.flight_id AS "flight id"
FROM bookings AS b
LEFT JOIN tickets AS t ON b.book_ref = t.book_ref
LEFT JOIN ticket_flights AS tf ON tf.ticket_no = t.ticket_no
LEFT JOIN boarding_passes AS bp ON tf.ticket_no = bp.ticket_no AND tf.flight_id = bp.flight_id
WHERE bp.boarding_no IS NULL
ORDER BY b.book_ref ASC, tf.flight_id ASC;