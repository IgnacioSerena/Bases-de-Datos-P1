--Consulta 5
SELECT b.book_ref, tf.flight_id
FROM bookings b 
LEFT JOIN tickets t ON b.book_ref = t.book_ref
LEFT JOIN ticket_flights tf ON t.ticket_no = tf.ticket_no
LEFT JOIN boarding_passes bp ON tf.ticket_no = bp.ticket_no
WHERE bp.boarding_no is NULL
ORDER BY b.book_ref ASC, bp.flight_id ASC;
