
--׼��ʵ������
--��KingbaseES�д���TEST���ݿ⣬Ȼ�󴴽�SALESģʽ��������TPC-H���ݿ�ģʽ
--�������ݿ�
create database TEST encoding = 'GBK';
--����ģʽ
create schema Sales;
--���������
/* ���õ�ǰ�ػ�������·��ΪSalesģʽ��publicģʽ��������ͻ��Զ�������Salesģʽ�¡�*/
set search_path to Sales;
--����Region��
create table Region (
	regionkey integer primary key,
	name char(25),
	comment varchar(152)
);
--����Nation��
create table nation (
	nationkey integer primary key,
	name char(25),
	regionkey integer references Sales.Region(regionkey),
	comment varchar(152)
);
--����Supplier��Ӧ�̻�����
create table supplier (
	suppkey integer primary key,				--��Ӧ�̱��
	name char(25),						--��Ӧ������
	address varchar(40),					--��Ӧ�̵�ַ
	nationkey integer references sales.nation(nationkey),	--���ұ��
	phone char(15),						--��Ӧ������
	acctbal REAL,						--��Ӧ�̵�ַ
	comment varchar(101)					--��ע
);
--����Part���������
create table Part(
	partkey integer primary key,		--������
	name varchar(55),			--�������
	mfgr char(10),				--���쳧
	brand char(10),				--Ʒ��
	type varchar(25),			--�������
	size integer,				--�ߴ�
	container char(10),			--��װ
	retailprice REAL,			--���ۼ۸�
	comment varchar(23)			--��ע
);
--����PartSupp�����Ӧ��ϵ��
create PartSupp(
	partkey integer references sales.part(partkey),
);
/*��D������tpcdataĿ¼�������ļ��ֱ������ݿ⵽Region��Nation��Part��Supplier��Customer�ȱ�*/
COPY Sales.Region from 'D:\FrontEnd\DatabaseExperiment\dbtestdata(CSV)\region.csv' with delimiter as ',';
COPY Sales.nation from 'D:\FrontEnd\DatabaseExperiment\dbtestdata(CSV)\nation.csv' with delimiter as ',';
COPY Sales.supplier from 'D:\FrontEnd\DatabaseExperiment\dbtestdata(CSV)\supplier.csv' with delimiter as ',';
select * from sales.supplier;

