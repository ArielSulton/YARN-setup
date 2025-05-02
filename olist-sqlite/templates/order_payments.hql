CREATE TABLE IF NOT EXISTS order_payments (
  order_id STRING,
  payment_sequential INT,
  payment_type STRING,
  payment_installments INT,
  payment_value DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");
