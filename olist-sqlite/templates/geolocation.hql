CREATE TABLE IF NOT EXISTS geolocation (
  geolocation_zip_code_prefix INT,
  geolocation_lat DOUBLE,
  geolocation_lng DOUBLE,
  geolocation_city STRING,
  geolocation_state STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");
