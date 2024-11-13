---exercise 5.2.1
SELECT u.id, u.name, t.seat_number
FROM train_tickets AS t
JOIN train_users AS u ON t.user = u.id
WHERE t.train = 11
ORDER BY t.seat_number ASC;

---exercise 5.2.2
SELECT u.id, u.name, COUNT(t.train) AS trains_count, SUM(tr.distance) AS total_distance
FROM train_tickets AS t
JOIN train_users AS u ON t.user = u.id
JOIN trains_time AS tr ON t.train = tr.id
GROUP BY u.id, u.name
ORDER BY total_distance DESC
LIMIT 6;

---exercise 5.2.3
SELECT tr.id, tt.name AS type, src.name AS src_stn, dst.name AS dst_stn, 
       TIMEDIFF(tr.arrival, tr.departure) AS travel_time
FROM trains_time AS tr
JOIN stations_name AS src ON tr.source = src.id
JOIN stations_name AS dst ON tr.destination = dst.id
JOIN train_types AS tt ON tr.type = tt.id
ORDER BY travel_time DESC
LIMIT 6;

---exercise 5.2.4
SELECT ty.name AS type, src.name AS src_stn, dst.name AS dst_stn, 
       tr.departure, tr.arrival, 
       ROUND((ty.fare_rate / 1000) * (tr.distance / 10), -2) AS fare
FROM trains_time AS tr
JOIN stations_name AS src ON tr.source = src.id
JOIN stations_name AS dst ON tr.destination = dst.id
JOIN train_types AS ty ON tr.type = ty.id
ORDER BY tr.departure ASC;

---exercise 5.2.5
SELECT tr.id, ty.name AS type, src.name AS src_stn, dst.name AS dst_stn, 
       COUNT(t.seat_number) AS occupied, ty.max_seats AS maximum
FROM trains_time AS tr
JOIN stations_name AS src ON tr.source = src.id
JOIN stations_name AS dst ON tr.destination = dst.id
JOIN train_types AS ty ON tr.type = ty.id
JOIN train_tickets AS t ON tr.id = t.train
GROUP BY tr.id
HAVING occupied > 0
ORDER BY tr.id ASC;


---exercise 5.2.6
SELECT tr.id, ty.name AS type, src.name AS src_stn, dst.name AS dst_stn, 
       COUNT(t.seat_number) AS occupied, ty.max_seats AS maximum
FROM trains_time AS tr
JOIN stations_name AS src ON tr.source = src.id
JOIN stations_name AS dst ON tr.destination = dst.id
JOIN train_types AS ty ON tr.type = ty.id
LEFT JOIN train_tickets AS t ON tr.id = t.train
GROUP BY tr.id
ORDER BY tr.id ASC;



