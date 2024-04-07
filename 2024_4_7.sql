create database five;

use five;

create table T(
Tno varchar(15),
Tname varchar(15),
Title varchar(15)
);

insert into T(Tno,Tname,Title)
values();

create table C(
Cno varchar(15),
Cname varchar(15),
Tno varchar(15)
);

create table S(
Sno varchar(15),
Sname varchar(15),
Age int,
Sex varchar(15)
);

insert into S(Sno,Sname,Age,Sex)
values('S5','王明',18,'女');

create table SC(
Sno varchar(15),
Cno varchar(15),
Score int
);

insert into SC(Sno,Cno,Score)
values('S5','c1',86);

select Sno,Sname 
from S
where Age > 20 and Sex = '男';

select C.Cno,C.Cname
from C,SC,S
where C.Cno = SC.Cno and S.Sno = SC.Sno and Sex = '女';

select cno,cname
from C
where Cno in 
(select Cno from SC where Sno in
    (select Sno from S where Sex = '女'))
;

select distinct T.Tno,T.Tname
from T,C,S,SC
where T.Tno = C.Tno and C.Cno = SC.Cno and S.Sno = SC.Sno and Sex = '女';

select Sno
from SC
group by Sno
having count(Cno) >= 2;

select SC.Cno 
from SC
where SC.Cno in
((select SC.Cno  from SC where SC.Sno like 'S3') and (select SC.Cno  from SC where SC.Sno like 'S3'));

select SC2.Cno
from SC SC1,SC SC2
where SC1.Sno = 'S3' and SC1.Sno = 'S6' and SC1.Cno = SC2.Cno;

select Cno
from SC
where SC.Sno = 'S3' and Cno in
(select Cno from SC where Sno = 'S6');

select SC.Cno
from SC,S
where S.Sno = SC.Sno and not exists
(select * from SC,S where  S.Sno = SC.Sno and Sname = '王珂');

select Cno,Cname
from C
where not exists
(select * from S where not exists 
(select * from SC where SC.Sno = S.Sno and SC.Cno = C.Cno));

select C.Cno,Cname
from C,SC
where C.Cno = SC.Cno
group by C.Cno,Cname
having count(Sno) = (select count(distinct Sno) from SC);

select distinct SC.Sno
from SC
where not exists
(select * from T where T.Tno = '刘老师' and not exists
(select * from C where C.Cno = SC.Cno and C.Tno = T.Tno));

select count(Cno)
from SC
group by Cno
having count(Sno) != 0;

select avg(Age)
from S,SC
where S.Sno = SC.Sno and Sex = '女' and SC.Cno = 'C4';

select avg(Score)
from T,C.SC
where T.Tno = C.Tno and C.Cno = SC.Cno and Tname = '张伟' 
group by Cno;

select Cno,count(*)
from SC
group by Cno
having count(*) > 10
order by count(*) desc,Cno asc;

select S2.Sname
from S S1,S S2
where S1.Sname= '王珂' and S1.Sno > S2.Sno and S1.Age > S2.Age ;

select Sno,Cno
from SC
where Score = null;

select Tno,Tname
from T
where Tname like '刘%';

select Sno,Age
from S
where Sex = '男' and Age > 
(select avg(age) from S where Sex = '女');

select Sname,Age
from S
where Sex = '男' and Age > 
all(select age from S where Sex = '女');