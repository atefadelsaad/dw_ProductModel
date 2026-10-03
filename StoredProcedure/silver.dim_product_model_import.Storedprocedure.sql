CREATE OR ALTER PROCEDURE silver.dim_product_model_import
AS
BEGIN
INSERT INTO [silver].[dim_product_model](
product_id,
name_product,
rowguid,
modified_data
)
SELECT 
productmodelid AS [product_id],
TRIM(name) AS [name_product],
REPLACE(rowguid,'-','_') AS [rowguid],
modifieddate AS modified_data
FROM [bronze].[erp_product_model]
END 