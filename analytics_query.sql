CREATE OR REPLACE TABLE `data-with-bhuvan.uber_data_engineering_by_bhuvan.tbl_analytics` AS (
SELECT
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pick.pickup_latitude,
pick.pickup_longitude,
drop.dropoff_latitude,
drop.dropoff_longitude,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount
FROM 

`data-with-bhuvan.uber_data_engineering_by_bhuvan.fact_table` f
JOIN `data-with-bhuvan.uber_data_engineering_by_bhuvan.datetime_dim` d  ON f.datetime_id=d.datetime_id
JOIN `data-with-bhuvan.uber_data_engineering_by_bhuvan.passenger_count_dim` p  ON p.passenger_count_id=f.passenger_count_id  
JOIN `data-with-bhuvan.uber_data_engineering_by_bhuvan.trip_distance_dim` t  ON t.trip_distance_id=f.trip_distance_id  
JOIN `data-with-bhuvan.uber_data_engineering_by_bhuvan.rate_code_dim` r ON r.rate_code_id=f.rate_code_id  
JOIN `data-with-bhuvan.uber_data_engineering_by_bhuvan.pickup_location_dim` pick ON pick.pickup_location_id=f.pickup_location_id
JOIN `data-with-bhuvan.uber_data_engineering_by_bhuvan.dropoff_location_dim` drop ON drop.dropoff_location_id=f.dropoff_location_id
JOIN `data-with-bhuvan.uber_data_engineering_by_bhuvan.payment_type_dim` pay ON pay.payment_type_id=f.payment_type_id)
;
