
--准备实验数据
--在KingbaseES中创建TEST数据库，然后创建SALES模式，并创建TPC-H数据库模式
--定义数据库
create database TEST encoding = 'GBK';
--定义模式
create schema Sales;
--定义基本表
/* 设置当前回话的搜索路径为Sales模式、public模式，基本表就会自动创建在Sales模式下。*/
set search_path to Sales;
--创建Region表
create table Region (
	regionkey integer primary key,
	name char(25),
	comment varchar(152)
);
--创建Nation表
create table nation (
	nationkey integer primary key,
	name char(25),
	regionkey integer references Sales.Region(regionkey),
	comment varchar(152)
);
--创建Supplier供应商基本表
create table supplier (
	suppkey integer primary key,				--供应商编号
	name char(25),						--供应商名称
	address varchar(40),					--供应商地址
	nationkey integer references sales.nation(nationkey),	--国家编号
	phone char(15),						--供应商名称
	acctbal REAL,						--供应商地址
	comment varchar(101)					--备注
);
--创建Part零件基本表
create table Part(
	partkey integer primary key,		--零件编号
	name varchar(55),			--零件名称
	mfgr char(10),				--制造厂
	brand char(10),				--品牌
	type varchar(25),			--零件类型
	size integer,				--尺寸
	container char(10),			--包装
	retailprice REAL,			--零售价格
	comment varchar(23)			--备注
);
--创建PartSupp零件供应联系表
create PartSupp(
	partkey integer references sales.part(partkey),
);
/*把D驱动器tpcdata目录中数据文件分别导入数据库到Region、Nation、Part、Supplier和Customer等表*/
COPY Sales.Region from 'D:\FrontEnd\DatabaseExperiment\dbtestdata(CSV)\region.csv' with delimiter as ',';
COPY Sales.nation from 'D:\FrontEnd\DatabaseExperiment\dbtestdata(CSV)\nation.csv' with delimiter as ',';
COPY Sales.supplier from 'D:\FrontEnd\DatabaseExperiment\dbtestdata(CSV)\supplier.csv' with delimiter as ',';
select * from sales.supplier;

