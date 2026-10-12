-- Databricks notebook source
select * from databeli_pii_demo.pii_target.customers

-- COMMAND ----------

CREATE OR REPLACE FUNCTION databeli_pii_demo.access_control.country_filter(country STRING)
RETURN 
  CASE 
    WHEN is_account_group_member('manager') THEN TRUE
    WHEN country = 'India' THEN TRUE
    ELSE FALSE
  END;

-- COMMAND ----------

ALTER TABLE databeli_pii_demo.pii_target.customers
SET ROW FILTER databeli_pii_demo.access_control.country_filter ON (country);

-- COMMAND ----------

select * from databeli_pii_demo.pii_target.customers