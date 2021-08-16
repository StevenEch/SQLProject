

create table Student(sid char(10) primary key,sname varchar(20) not null, gpa float, major char(10), dob DATE);

create table Course(cno char(10) primary key,cname varchar(20) not null, credits int, dept char(10));

create table Reg(  sid references Student(sid) on delete cascade,  cno references Course(cno) on delete cascade,  grade char(2),  primary key (sid, cno));

insert into Student values('111', 'Joe', 3.5 , 'MIS', '01-AUG-2000');

insert into Student values('222', 'Jack', 3.4  , 'MIS', '12-JAN-1999');

insert into Student values('333', 'Jill', 3.2 , 'CS', '15-MAY-1998');

insert into Student values('444', 'Mary', 3.7 , 'CS', '17-DEC-2001');

insert into Student values('555', 'Peter', 3.8 , 'CS', '19-MAR-1999');

insert into Student values('666', 'Pat', 3.9,  'Math', '31-MAY-2000');

insert into Student values('777', 'Tracy', 4.0,  'Math', '18-JUL-1997');

insert into Course values('c101', 'intro', 3 , 'CS');

insert into Course values('m415', 'database', 4 , 'Bus');

insert into Course values('m215', 'programming', 4 , 'Bus');

insert into Course values('a444', 'calculus', 3 , 'Math');

insert into Reg values('111', 'c101', 'A');

insert into Reg values('111', 'm215', 'B');

insert into Reg values('111', 'm415', 'A');

insert into Reg values('222', 'm215', 'A');

insert into Reg values('222', 'm415', 'B');

insert into Reg values('333', 'c101', 'A');

insert into Reg values('444', 'm215', 'C');

insert into Reg values('444', 'm415', 'B');

insert into Reg values('555', 'c101', 'B');

insert into Reg values('555', 'm215', 'A');

insert into Reg values('555', 'm415', 'A');

insert into Reg values('666', 'c101', 'A');

Select gpa, sname 
from student 
where gpa > 3.8 
order by gpa desc;

Select major, sname 
from student 
where major = 'CS' 
order by sname asc;

Select sname  
from student  
where sname like 'J%';

Select major, sname 
from student  
where Major = 'MIS' 
or 
Major ='CS';

Select dob, sname 
from student  
where dob <'01-JUL-2000' 
order by dob asc;

select gpa, sname 
from student  
where gpa <= 3.2  
OR 
gpa <= 3.7;

select credits, cname 
from Course 
where cname= 'database';

select sname, gpa, dob, major 
from student  
where gpa > 3.5 
and  
major = 'CS';

select sname, dob 
from student  
where dob >'12-DEC-1998' 
and  
sname like 'P%';

select cno, grade, count(grade)  
from Reg  
group by grade, cno 
having grade = 'B' 
and  
cno = 'm415';

select Max(gpa) 
from student   
where major = 'CS' ;

select count(sname), major 
from student 
group by major  
having count(sname)>2;

SELECT grade, cno, count(distinct sid)  
FROM Reg  
GROUP BY cno, grade ORDER BY cno, grade;

SELECT SNAME, TRUNC((SYSDATE-DOB)/365,0) 
FROM STUDENT 
ORDER BY DOB;

select   
major, count(sname),  
round(min(gpa),2) ,round(max(gpa),2), round(avg(gpa),2), 
round(min(TRUNC((SYSDATE-DOB)/365,0)),0),  
round(max(TRUNC((SYSDATE-DOB)/365,0)),0), 
round(avg(TRUNC((SYSDATE-DOB)/365,0)),0) 
from student 
group by major ;

