--Consulta 2
SELECT b.book_ref,
       b.total_amount,
       Sum(tf.amount) AS calculated_amount
FROM   bookings b,
       tickets t,
       ticket_flights tf
WHERE  b.book_ref = t.book_ref
       AND t.ticket_no = tf.ticket_no
GROUP  BY b.book_ref,
          b.total_amount
ORDER  BY b.book_ref ASC;
