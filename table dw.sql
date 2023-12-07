drop database DW
go
create database DW
go
use DW
go
create schema lesson3
go
--- create Dimension ---
create table lesson3.DimYear
(
   YearKey nvarchar(4) not null,
   Year int not null,
   constraint PK_DimYear primary key(YearKey)
)
go
create table lesson3.DimMonth
(
  MonthKey nvarchar(6) not null,
  YearKey nvarchar(4)  not null,
  Month int not null,
  constraint PK_DimMonth primary key(MonthKey),
  constraint FK_DimMonth_DimYear foreign key(YearKey) references lesson3.DimYear(YearKey)
)
go
create table lesson3.DimDate
(
  DateKey nvarchar(8) not null,
  MonthKey nvarchar(6) not null,
  date date not null,
  constraint PK_DimDate primary key(DateKey),
  constraint FK_DimDate_DimMonth foreign key(Monthkey) references lesson3.DimMonth(MonthKey)
)
go
create table lesson3.Dim_SalesPerson
(
  SalesPersonKey int identity(1,1) not null,
  SalePersonID int not null,
  FullName nvarchar(500) not null,
  NationalIdNumber nvarchar(15) not null,
  Gender nchar(1) not null,
  HireDate date not null,
  constraint PK_Dim_SalesPerson primary key (SalesPersonKey)
)
go
create table lesson3.Dim_Territory
(
  TerritoryKey int identity(1,1) not null,
  TerritoryID int not null,
  Name nvarchar(50) not null,
  CountryRegionCode nvarchar(3) not null,
  constraint PK_Dim_Territory primary key(TerritoryKey)
)
go
create table lesson3.Dim_ProductCategory
(
   ProductCategoryKey int identity(1,1) not null,
   productCategoryId int not null,
   Name nvarchar(50) not null,
   constraint PK_Dim_ProductCategory primary key(ProductCategoryKey)
)
go
create table Dim_ProductSubCategory
(
   ProductSubCategoryKey int identity(1,1) not null,
   ProductSubCategoryId int not null,
   Name nvarchar(50) not null,
   ProductCategoryKey int not null,
   constraint PK_Dim_ProductSubCategory primary key(ProductSubCategoryKey),
   constraint FK_Dim_ProductSubCategory_Dim_ProductCategory foreign key(ProductCategoryKey) references lesson3.Dim_ProductCategory(ProductCategoryKey)
)
go
create table lesson3.Product
(
  ProductKey int identity(1,1) not null,
  ProductID int not null,
  Name nvarchar(50) not null,
  ProductNumber nvarchar(25) not null,
  StandardCost money not null,
  ListPrice money not null,
  Weight numeric(8,2)  null,
  ProductSubCategoryKey int  null,
  constraint PK_Dim_Product primary key (ProductKey),
  constraint PK_Dim_Product_Dim_ProductSubCategory foreign key (ProductSubCategoryKey ) references Dim_ProductSubCategory(ProductSubCategoryKey)
  )
  ----- Create fact sales order
  go
  create table lesson3.Fact_SalesOrder
  (
    Id int identity(1,1) not null,
	DateKey nvarchar(8) not null,
	TerritoryKey int not null,
	SalesPersonKey int not null,
	Revenue money not null,
	NumberOrder numeric(20,0) not null,
	constraint PK_Fact_SalesOrder primary key(Id),
	constraint FK_Fact_SalesOrder_Dim_SalesPerSon foreign key (SalesPersonKey) references lesson3.Dim_SalesPerson(SalesPersonKey),
	constraint FK_Fact_SalesOrder_Dim_Territory foreign key(TerritoryKey) references lesson3.Dim_Territory(TerritoryKey),
	constraint FK_Fact_SalesOrder_Dim_Date foreign key (DateKey) references [lesson3].[DimDate](DateKey)
	
	)
go
create table lesson3.Fact_Product
(
  Id int identity(1,1) not null,
  DateKey nvarchar(8) not null,
  ProductKey int not null,
  TerritoryKey int not null,
  Qty bigint not null,
  constraint PK_Fact_Product primary key(Id),
	constraint FK_Fact_Product_Dim_Product foreign key (ProductKey) references [lesson3].[Product](ProductKey),
	constraint FK_Fact_Product_Dim_Territory foreign key(TerritoryKey) references lesson3.Dim_Territory(TerritoryKey),
	constraint FK_Fact_Product_Dim_Date foreign key (DateKey) references [lesson3].[DimDate](DateKey)
)