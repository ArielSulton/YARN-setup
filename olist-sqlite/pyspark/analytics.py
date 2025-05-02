from pyspark.sql import SparkSession
from pyspark.sql.functions import col, count, avg, sum as _sum, desc, datediff

spark = SparkSession.builder \
    .appName("Hive E-Commerce Analytics") \
    .enableHiveSupport() \
    .getOrCreate()

customers = spark.table("customers")
sellers = spark.table("sellers")
orders = spark.table("orders")
order_items = spark.table("order_items")
order_payments = spark.table("order_payments")
order_reviews = spark.table("order_reviews")
products = spark.table("products")
geolocation = spark.table("geolocation")

total_customers = customers.count()
print(f"Total Customers: {total_customers}")

total_sellers = sellers.count()
print(f"Total Sellers: {total_sellers}")

total_orders = orders.count()
print(f"Total Orders: {total_orders}")

order_payments_summary = order_payments.groupBy("order_id").agg(
    _sum("payment_value").alias("total_payment")
)
avg_order_value = order_payments_summary.agg(avg("total_payment")).first()[0]
print(f"Average Order Value: {avg_order_value:.2f}")

top_payment_method = order_payments.groupBy("payment_type").count().orderBy(desc("count")).first()
print(f"Top Payment Method: {top_payment_method['payment_type']} ({top_payment_method['count']} transactions)")

avg_review_score = order_reviews.agg(avg("review_score")).first()[0]
print(f"Average Review Score: {avg_review_score:.2f}")

popular_products = order_items.groupBy("product_id").count().orderBy(desc("count")).limit(5)
popular_products = popular_products.join(products, "product_id", "left")
popular_products.select("product_id", "product_category_name", "count").show(truncate=False)

orders_customers = orders.join(customers, "customer_id", "left")
top_cities = orders_customers.groupBy("customer_city").count().orderBy(desc("count")).limit(5)
top_cities.show(truncate=False)

delivered_orders = orders.filter(
    (col("order_delivered_customer_date").isNotNull()) &
    (col("order_purchase_timestamp").isNotNull())
)
delivery_time = delivered_orders.withColumn(
    "delivery_days",
    datediff(col("order_delivered_customer_date"), col("order_purchase_timestamp"))
)
avg_delivery_days = delivery_time.agg(avg("delivery_days")).first()[0]
print(f"Average Delivery Time (days): {avg_delivery_days:.2f}")

top_sellers = order_items.groupBy("seller_id").count().orderBy(desc("count")).limit(5)
top_sellers = top_sellers.join(sellers, "seller_id", "left")
top_sellers.select("seller_id", "seller_city", "seller_state", "count").show(truncate=False)

spark.stop()
