create or alter procedure bronze.load_bronze as
begin
	declare @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime;
	begin try
		set @batch_start_time = GETDATE(); 
		print '============================================================';
		print 'Loading Bronze Layer';
		print '============================================================';





		print '------------------------------------------------------------';
		print 'Loading CRM Tables';
		print '------------------------------------------------------------';
		


		set @start_time = GETDATE(); 
		print '<< Truncating Table: bronze.crm_cust_info';
		truncate table bronze.crm_cust_info;
		print '<< Inserting Data into: bronze.crm_cust_info';
		bulk insert bronze.crm_cust_info
		from 'C:\Users\ShashankGoyal\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print 'Load Duration: ' +  cast(datediff(second, @start_time, @end_time) as nvarchar) + 's';
		print '-------------------';


		set @start_time = GETDATE(); 
		print '<< Truncating Table: bronze.crm_prd_info';
		truncate table bronze.crm_prd_info;
		print '<< Inserting Data into: bronze.crm_prd_info';
		bulk insert bronze.crm_prd_info
		from 'C:\Users\ShashankGoyal\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print 'Load Duration: ' +  cast(datediff(second, @start_time, @end_time) as nvarchar) + 's';
		print '-------------------';


		set @start_time = GETDATE(); 
		print '<< Truncating Table: bronze.crm_sales_details';
		truncate table bronze.crm_sales_details;
		print '<< Inserting Data into: bronze.crm_sales_details';
		bulk insert bronze.crm_sales_details
		from 'C:\Users\ShashankGoyal\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print 'Load Duration: ' +  cast(datediff(second, @start_time, @end_time) as nvarchar) + 's';
		print '-------------------';



		print '------------------------------------------------------------';
		print 'Loading ERP Tables';
		print '------------------------------------------------------------';



		set @start_time = GETDATE(); 
		print '<< Truncating Table: bronze.erp_CUST_AZ12';
		truncate table bronze.erp_CUST_AZ12;
		print '<< Inserting Data into: bronze.erp_CUST_AZ12';
		bulk insert bronze.erp_CUST_AZ12
		from 'C:\Users\ShashankGoyal\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print 'Load Duration: ' +  cast(datediff(second, @start_time, @end_time) as nvarchar) + 's';
		print '-------------------';


		set @start_time = GETDATE(); 
		print '<< Truncating Table: bronze.erp_LOC_A101';
		truncate table bronze.erp_LOC_A101;
		print '<< Inserting Data into: bronze.erp_LOC_A101';
		bulk insert bronze.erp_LOC_A101
		from 'C:\Users\ShashankGoyal\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print 'Load Duration: ' +  cast(datediff(second, @start_time, @end_time) as nvarchar) + 's';
		print '-------------------';


		set @start_time = GETDATE(); 
		print '<< Truncating Table: bronze.erp_PX_CAT_G1V2';
		truncate table bronze.erp_PX_CAT_G1V2;
		print '<< Inserting Data into: bronze.erp_PX_CAT_G1V2';
		bulk insert bronze.erp_PX_CAT_G1V2
		from 'C:\Users\ShashankGoyal\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print 'Load Duration: ' +  cast(datediff(second, @start_time, @end_time) as nvarchar) + 's';
		print '-------------------';



		set @batch_end_time = GETDATE(); 
		print '==============================================';
		print 'Loading Bronze Layer is completed';
		print '	- Total Load Duration: ' +  cast(datediff(second, @batch_start_time, @batch_end_time) as nvarchar) + 's';
		print '==============================================';
	end try

	begin catch
		print '==============================================';
		print 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR MESSAGE ' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE ' + CAST( ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE ' + CAST( ERROR_STATE() AS NVARCHAR);
		print '==============================================';
	end catch

end
