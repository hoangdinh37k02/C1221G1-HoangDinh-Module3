-- drop DATABASE `student-management`;
CREATE DATABASE `student-management`;

use `student-management`;
create table `student`(
`id` int primary key,
`name` varchar(50) null,
`age` int null,
`country` varchar(45) null
);
create table `class`(
`id` int primary key,
`name` varchar(50) null
);
create table `teacher`(
`id` int primary key,
`name` varchar(50) null,
`age` int null,
`country` varchar(45) null
);
