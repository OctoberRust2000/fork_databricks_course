# Databricks notebook source
# /// script
# [tool.databricks.environment]
# environment_version = "6"
# ///
# from pyspark.sql import SparkSession

# # JDBC connection properties
# jdbc_url = "jdbc:databricks:dbc-3f1c04d0-60d3.cloud.databricks.com:443/default;transportMode=http;ssl=1;AuthMech=3;httpPath=/sql/1.0/warehouses/ac27879dd8a7975e;"

# access_token = dbutils.secrets.get(scope = "databeli_pii_demo_scope", key = "PAT_TOKEN")

# # SQL query or table
# query = "(SELECT * FROM databeli_pii_demo.pii_source.customers) AS t"

# # Read data
# df = spark.read \
#     .format("jdbc") \
#     .option("url", jdbc_url) \
#     .option("query", query) \
#     .option("user", "token") \
#     .option("password", access_token) \
#     .option("driver", "com.databricks.client.jdbc.Driver") \
#     .load()

# display(df)


# COMMAND ----------

# DBTITLE 1,Select only the columns which are required
df_source = spark.read.table("databeli_pii_demo.pii_source.customers")

df_minimized = df_source.select("customer_id", "city", "country") ## select only the columns which are required 

df_minimized.write.mode("overwrite").saveAsTable("databeli_pii_demo.pii_target.customers_minimized")

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from databeli_pii_demo.pii_target.customers_minimized

# COMMAND ----------

# MAGIC %sql
# MAGIC select country, count(*) as number_of_customers
# MAGIC from databeli_pii_demo.pii_target.customers_minimized
# MAGIC group by country
# MAGIC order by number_of_customers desc