CREATE TABLE IF NOT EXISTS sellers (
  seller_id STRING,
  seller_zip_code_prefix INT,
  seller_city STRING,
  seller_state STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");
