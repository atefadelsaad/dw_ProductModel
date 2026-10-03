from airflow import DAG
from datetime import datetime, timedelta
from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator

conn_id = "ERP_Product_model"

with DAG (
    dag_id = "basic_product_model_operations",
    description="basic_product_model_operations",
    start_date=datetime(2026, 8, 15),
    schedule="0 7 * * *",
    catchup=False,
) as dag :

 cleanup_product_model = SQLExecuteQueryOperator(
    task_id = "cleanup_product_model",
    conn_id = conn_id,
    sql = """
    EXEC silver.dim_product_model_cleanup
    """

)

 import_product_model = SQLExecuteQueryOperator(
    task_id = "import_product_model",
    conn_id = conn_id,
    sql = """
    EXEC silver.dim_product_model_import
    """

)
 
merge_product_model = SQLExecuteQueryOperator(
    task_id = "merge_product_model",
    conn_id = conn_id,
    sql = """
    EXEC gold.dim_product_model_merge
    """

)

cleanup_product_model >> import_product_model >> merge_product_model
