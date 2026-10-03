	CREATE OR ALTER PROCEDURE gold.dim_product_model_merge
	AS
BEGIN
BEGIN TRY
      MERGE [gold].[dim_product_model] AS target
		  USING [silver].[dim_product_model] AS source
		        ON target.[product_id] = source.[product_id]
          WHEN MATCHED AND (
		  
		        target.[name_product] <> source.[name_product]
		     OR target.[rowguid] <> source.[rowguid]
             OR target.[modified_data] <> source.[modified_data]
		    )
			THEN UPDATE SET
			    target.[name_product] = source.[name_product],
		        target.[rowguid] = source.[rowguid],
                target.[modified_data] = source.[modified_data],
				target.last_update = GETDATE() 

	   WHEN NOT MATCHED BY target
	   THEN 
	        INSERT(product_id,name_product,rowguid,modified_data,last_update)
			VALUES(source.product_id,source.name_product,source.rowguid,source.modified_data,GETDATE() );

	   END
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END