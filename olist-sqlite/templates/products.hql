CREATE TABLE IF NOT EXISTS products (
  product_id STRING,
  product_category_name STRING,
  product_name_lenght DOUBLE,
  product_description_lenght DOUBLE,
  product_photos_qty DOUBLE,
  product_weight_g DOUBLE,
  product_length_cm DOUBLE,
  product_height_cm DOUBLE,
  product_width_cm DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");
