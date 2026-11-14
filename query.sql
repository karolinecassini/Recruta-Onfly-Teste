--CREATE TABLE reservas_hoteis AS SELECT * FROM read_csv_auto('/home/karol/Documentos/onfly-desafio/data/reservas_hoteis.csv');

SELECT
    reservation_id,
    checkin_date,
    checkout_date,
    rooms
FROM reservas_hoteis
LIMIT 1;