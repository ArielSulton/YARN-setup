CREATE TABLE IF NOT EXISTS leads_qualified (
  mql_id STRING,
  first_contact_date STRING,
  landing_page_id STRING,
  origin STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");
