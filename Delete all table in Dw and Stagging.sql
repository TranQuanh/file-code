USE [DW]
GO
delete lesson3.Fact_SalesOrder
delete lesson3.DimDate
delete lesson3.DimMonth
delete lesson3.DimYear
delete lesson3.Dim_Territory
delete lesson3.Dim_SalesPerson
delete[lesson3].[Fact_Product]
delete[lesson3].[Dim_ProductCategory]
delete[dbo].[Dim_ProductSubCategory]
delete[lesson3].[Product]
use [DW_STAGGING]   
go
delete[dbo].[Save Stag Product]
delete[dbo].[Save Stag Category]
delete[dbo].[Save Stag Dim_SalesPerson]
delete[dbo].[Save Stag Fact_SalesOrder]
delete[dbo].[Save Stag Order Detail]
delete[dbo].[Save Stag Order Header]
delete[dbo].[Save Stag- Product Subcategory]
delete[dbo].[Save Stag Territory]
delete[dbo].[Save Stag_Dimdate]
delete[dbo].[Save Stag_Employee]
delete[dbo].[Save Stag-Person]
delete[dbo].[Save Stag_DimTerritoy]
delete[dbo].[Save Stag Dim_Product]
delete[dbo].[Save Stag- Product Subcategory]
delete[dbo].[Save Stag Category]
delete[dbo].[Save Stag Fact_Product]