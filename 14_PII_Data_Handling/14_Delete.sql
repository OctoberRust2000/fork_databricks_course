-- Databricks notebook source
ALTER TABLE databeli_pii_demo.pii_target.employees_rounded SET TBLPROPERTIES ('delta.deletedFileRetentionDuration' = '30 days');--default is 7 days

-- COMMAND ----------

delete from databeli_pii_demo.pii_target.employees_rounded where employee_id=2

-- COMMAND ----------

select * from databeli_pii_demo.pii_target.employees_rounded where employee_id=2

-- COMMAND ----------

describe history databeli_pii_demo.pii_target.employees_rounded

-- COMMAND ----------

select * from databeli_pii_demo.pii_target.employees_rounded version as of 1 where employee_id=2

-- COMMAND ----------

vacuum databeli_pii_demo.pii_target.employees_rounded