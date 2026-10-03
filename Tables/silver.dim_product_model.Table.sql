DROP TABLE IF EXISTS silver.dim_product_model
CREATE TABLE silver.dim_product_model(
product_id INT PRIMARY KEY NOT NULL,
name_product NVARCHAR(100) NOT NULL,
rowguid NVARCHAR(MAX) NOT NULL,
modified_data DATE NOT NULL
)