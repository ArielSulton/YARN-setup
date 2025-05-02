CREATE TABLE IF NOT EXISTS product_category_name_translation (
  product_category_name STRING,
  product_category_name_english STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");
