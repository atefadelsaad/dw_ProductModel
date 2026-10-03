	CREATE OR ALTER PROCEDURE silver.dim_product_model_cleanup
	AS
	BEGIN
	TRUNCATE TABLE [silver].[dim_product_model]
	END