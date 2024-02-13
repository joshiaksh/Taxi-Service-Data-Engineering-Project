Create table `Taxi_Data.tax_service_analytics` as (SELECT 
f.trip_distance_id,
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
t.trip_distance,
r.ratecode_name,
pickup.pickup_latitude,
pickup.pickup_longitude,
dropoff.dropoff_latitude,
dropoff.dropoff_longitude,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount
FROM 
`Taxi_Data.taxi_fact` f
JOIN `Taxi_Data.datetime` d  ON f.datetime_id=d.datetime_id
JOIN `Taxi_Data.passenger` p  ON p.passenger_cnt_id=f.passenger_cnt_id  
JOIN `Taxi_Data.trip_distance` t  ON t.trip_distance_id=f.trip_distance_id  
JOIN `Taxi_Data.ratecode` r ON r.ratecode_id=f.ratecode_id  
JOIN `Taxi_Data.pickup_location` pickup ON pickup.pickup_location_id=f.pickup_location_id
JOIN `Taxi_Data.drop_location` dropoff ON dropoff.dropoff_location_id=f.dropoff_location_id
JOIN `Taxi_Data.paymenttype` pay ON pay.payment_type_id=f.payment_type_id);
