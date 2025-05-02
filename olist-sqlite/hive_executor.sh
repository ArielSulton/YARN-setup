#!/bin/bash

TEMPLATE_DIR="templates"
DATA_DIR="/user/hive/data/csv_output"
HIVE_SERVER="jdbc:hive2://hadoop-master:10000"

echo "Starting table creation..."

for hql_file in "$TEMPLATE_DIR"/*.hql
do
  echo "Executing $hql_file..."
  beeline -u "$HIVE_SERVER" -f "$hql_file"
done

echo "Table creation complete."

echo "Starting data loading..."

for csv_file in $(hdfs dfs -ls "$DATA_DIR" | awk '{print $8}' | grep '.csv$')
do
  base_name=$(basename "$csv_file" .csv)

  echo "Loading $csv_file into table $base_name..."

  beeline -u "$HIVE_SERVER" -e "
    LOAD DATA INPATH '$csv_file'
    OVERWRITE INTO TABLE $base_name;
  "
done

echo "Data loading complete."
