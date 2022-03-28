-- drop DATABASE `student-management`;
CREATE DATABASE `student-management`;
use `student-management`;
create table `student`(
`id_student` int primary key,
`name` varchar(50),
`age` int,
`country` varchar(45)
);
create table `class`(
`id_class` int primary key,
`name` varchar(50)
);
create table `teacher`(
`id` int primary key,
`name` varchar(50),
`age` int,
`country` varchar(45)
);
