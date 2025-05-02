CREATE TABLE IF NOT EXISTS customers (
  customer_id STRING,
  customer_unique_id STRING,
  customer_zip_code_prefix INT,
  customer_city STRING,
  customer_state STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");
