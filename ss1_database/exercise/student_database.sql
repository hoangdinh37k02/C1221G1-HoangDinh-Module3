-- drop DATABASE `student-management`;
CREATE DATABASE `student-management`;
use `student-management`;
create table `student`(
`id_student` int auto_increment,
`name` varchar(50),
`age` int,
`country` varchar(45),
primary key (`id_student`));
create table `class`(
`id_class` int primary key auto_increment,
`name` varchar(50)
);
create table `teacher`(
`id` int primary key auto_increment,
`name` varchar(50),
`age` int,
`country` varchar(45)
);

insert into student (`name`, `age`, `country`)  value("hoang",18,"VN"),("adnes",23,"ENG");
insert into student (`name`, `age`, `country`)  value("dinh",18,"VN");
insert into student (`name`, `age`, `country`)  value("quan",22,"VN");
alter table student drop `age`;

alter table student add `age` int;

update student set `age` = 18 where `id_student` = 1;

delete from student where `id_student` = 1;

set sql_safe_updates = 0;
delete from student where `name` = "dinh";
set sql_safe_updates = 1;

select id_student, `name` from student;

