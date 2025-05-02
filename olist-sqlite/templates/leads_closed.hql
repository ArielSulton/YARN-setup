CREATE TABLE IF NOT EXISTS leads_closed (
  mql_id STRING,
  seller_id STRING,
  sdr_id STRING,
  sr_id STRING,
  won_date STRING,
  business_segment STRING,
  lead_type STRING,
  lead_behaviour_profile STRING,
  has_company STRING,
  has_gtin STRING,
  average_stock STRING,
  business_type STRING,
  declared_product_catalog_size STRING,
  declared_monthly_revenue STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");
