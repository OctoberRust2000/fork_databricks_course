-- Databricks notebook source
-- DBTITLE 1,Created View
create or replace view databeli_pii_demo.pii_target.customers_suppressed
as select 
customer_id,
country
 from databeli_pii_demo.pii_target.customers

-- COMMAND ----------

select* from databeli_pii_demo.pii_target.customers_suppressed