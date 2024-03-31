create database 图书管理;

use 图书管理;

create table 图书
(
图书号 varchar(15),
图书名称 varchar(30),
主编 varchar(30),
出版社 varchar(15),
单价 float
);

alter table 图书 add primary key(图书号);

create table 读者
(
读者编号 char(6),
constraint PK_DZH primary key(读者编号),
读者姓名 char(10),
性别 char(2),
出生日期 date,
所在部门 char(8)
);

drop table 读者;

create table 读者
(
读者编号 char(6),
constraint PK_DZH primary key(读者编号),
读者姓名 char(10),
性别 char(2),
出生日期 date,
所在部门 char(8)
);

create table 借阅
(
读者编号 char(6),
图书号 varchar(15),
借阅日期 date,
还书日期 date
);

drop table 借阅;

create table 借阅
(
读者编号 char(6),
图书号 varchar(15),
借阅日期 date,
还书日期 date,
primary key (读者编号,图书号)
);

drop table 借阅;

create table 借阅
(
读者编号 char(6),
图书号 varchar(15),
借阅日期 date,
还书日期 date,
primary key (读者编号,图书号),
constraint PK_JY2 foreign key (读者编号) references 读者(读者编号),
constraint PK_JY3 foreign key (图书号) references 图书(图书号)
);

drop table 借阅;

drop table 图书;

create table 图书
(
图书号 varchar(15),
图书名称 varchar(30) unique,
主编 varchar(30),
出版社 varchar(15),
单价 float
);

drop table 图书;

create table 图书
(
图书号 varchar(15),
图书名称 varchar(30),
 constraint un_sm unique(图书名称),
主编 varchar(30),
出版社 varchar(15),
单价 float
);

drop table 读者;

create table 读者
(
读者编号 char(6),
读者姓名 char(10),
性别 char(2),
出生日期 date,
所在部门 char(8),
 constraint un_dz unique(读者姓名,出生日期)
);

drop table 图书;

create table 图书
(
图书号 varchar(15),
图书名称 varchar(30),
主编 varchar(30) not null,
出版社 varchar(15) default '清华大学出版社',
单价 float check(单价>=0 and 单价<=1000)
);

drop table 图书;

create table 图书
(
图书号 varchar(15),
图书名称 varchar(30),
主编 varchar(30) not null,
出版社 varchar(15) default '清华大学出版社',
单价 float,
constraint ch_dj check(单价>=0 and 单价<=1000)
);

alter table 图书 add 出版年份 date;

create table 借阅
(
读者编号 char(6),
图书号 varchar(15),
借阅日期 date,
还书日期 date
);

alter table 借阅 add constraint C_JY check(借阅日期<还书日期);

#alter table 借阅 add check(结束日期<还书日期);

drop table 图书;

create table 图书
(
图书号 varchar(15),
图书名称 varchar(30) unique,
主编 varchar(30),
出版社 varchar(15),
单价 float
);

alter table 图书 drop index 图书名称;

alter table 图书 add 出版年份 date;

#alter table 图书 drop column 出版年份;

alter table 图书 modify 单价 int;

drop table 图书;

create unique index idx_tsh on 图书(图书号);
create unique index idx_dzh on 读者(读者编号);
create unique index idx_tsh_dzh on 借阅(读者编号 asc,图书号desc);

drop index idx_tsh on 图书;

create table 图书
(
图书号 varchar(15),
图书名称 varchar(30),
主编 varchar(30),
出版社 varchar(15),
单价 float
);

select 图书号,图书名称
from 图书;

select 图书号,单价,图书号
from 图书;

select *
from 图书;

select 图书名称,单价-100
from 图书;

select 读者姓名,'Year of Birth:',YEAR(出生日期)
from 读者;

show create table 借阅;

select 读者姓名 as 姓名,'Year of Birth:' as BIRTH,YEAR(出生日期) as 出生年份
from 读者;

select distinct 读者编号
from 借阅;

drop table 图书;

create table 图书
(
图书号 varchar(15),
图书名称 varchar(30),
主编 varchar(30),
出版社 varchar(15),
单价 float
);

insert into 图书(图书号,图书名称,主编,出版社,单价)
values(123,'数据库','李政','清华大学出版社',66);

select 图书名称
from 图书
where 出版社='清华大学出版社';

select 图书名称,出版社
from 图书
where 单价*0.5 > 30;

insert into 图书(图书号,图书名称,主编,出版社,单价)
values(456,'数据结构','王熙凤','高等教育出版社',77);

select 图书名称,图书号
from 图书
where 出版社 = '清华大学出版社' or 出版社 = '高等教育出版社';

drop table 借阅;

create table 借阅
(
读者编号 char(6),
图书号 varchar(15),
借阅日期 date,
还书日期 date
);

insert into 借阅(读者编号,图书号,借阅日期,还书日期)
values('abc','123',null,null);

select 读者编号,图书号
from 借阅
where 还书日期 is null;

select 图书名称,图书号
from 图书
where 出版社 in ('清华大学出版社' ,'高等教育出版社');

insert into 图书(图书号,图书名称,主编,出版社,单价)
values(789,'java','莫言','高等教育出版社',88);

select *
from 图书
where 主编 like '莫言';

select 图书名称,主编,出版社
from 图书
where 主编 like '莫%';

select 图书名称,主编
from 图书
where 主编 like '莫_';

select 图书名称,主编
from 图书
where 主编 like '_言%';

select 图书名称,主编,出版社
from 图书
where 主编 like '莫%';

insert into 图书(图书号,图书名称,主编,出版社,单价)
values(789,'数据库_第二版','莫言','高等教育出版社',35);

select 图书名称,主编,出版社
from 图书
where 图书名称 like '数据库\_第二版';

select *
from 图书
where 单价 between 30 and 50;

select *
from 图书
where 单价 not between 30 and 50;

select 图书名称,单价
from 图书
where 主编 = '莫言'
order by 单价 desc;

select *
from 图书
order by 出版社,单价 desc;

select count(*)
from 图书;

select count(distinct 图书号)
from 借阅;

select avg(单价)
from 图书
where 主编 = '莫言';

select min(单价),max(单价)
from 图书; 

select 出版社,count(图书号)
from 图书
group by 出版社;

select 读者编号
from 借阅
group by 读者编号
having count(*)>3;

select 读者编号,count(图书号)
from 借阅
where 图书号<>'123'
group by 读者编号
having count(图书号)>3
order by count(图书号) desc;

alter table 借阅 add 借阅编号 date;

select 读者.* , 借阅.*
from 读者,借阅
where 读者.读者编号=借阅.借阅编号;

select 读者.读者编号,读者姓名,性别,出生日期,所在部门,图书号,借阅日期,还书日期
from 读者,借阅
where 读者.读者编号=借阅.借阅编号;

select T2.图书名称,T2.出版社,T2.主编
from 图书 T1,图书 T2
where T1.出版社 = T2.出版社 and T1.主编 = '莫言';

select 读者.读者编号,读者姓名,性别,出生日期,所在部门,图书号,借阅日期,还书日期
from 读者 left outer join 借阅 on 读者.读者编号 = 借阅.借阅编号;

select 读者姓名,图书名称,借阅日期
from 读者,借阅,图书
where 图书.图书号=借阅.图书号 and 读者.读者编号=借阅.借阅编号 and 出版社 = '高等教育出版社';