from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("Hive Integration") \
    .config("spark.sql.warehouse.dir", "/user/hive/warehouse") \
    .enableHiveSupport() \
    .getOrCreate()

print("Spark Session created with Hive support.")

spark.sql("SHOW DATABASES").show()
spark.sql("USE default")
spark.sql("SHOW TABLES").show()

df = spark.sql("SELECT * FROM customers LIMIT 5")
df.show()
