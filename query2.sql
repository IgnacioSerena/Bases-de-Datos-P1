--Consulta 2
SELECT
    b.book_ref AS "booking.book_ref",
    b.total_amount AS "booking.total_amount",
    SUM(tf.amount) AS "Precio Calculado"
FROM bookings AS b
JOIN ticket_flights AS tf ON b.book_ref = tf.ticket_no
GROUP BY b.book_ref, b.total_amount
ORDER BY b.book_ref;