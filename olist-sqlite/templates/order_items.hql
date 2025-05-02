CREATE TABLE IF NOT EXISTS order_items (
  order_id STRING,
  order_item_id INT,
  product_id STRING,
  seller_id STRING,
  shipping_limit_date STRING,
  price DOUBLE,
  freight_value DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");
