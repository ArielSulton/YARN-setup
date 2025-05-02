CREATE TABLE IF NOT EXISTS order_reviews (
  review_id STRING,
  order_id STRING,
  review_score INT,
  review_comment_title STRING,
  review_comment_message STRING,
  review_creation_date STRING,
  review_answer_timestamp STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");
