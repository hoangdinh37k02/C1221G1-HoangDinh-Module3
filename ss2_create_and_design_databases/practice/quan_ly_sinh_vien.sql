CREATE DATABASE quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table class(
class_id int auto_increment PRIMARY KEY,
class_name varchar(60) not null,
start_date datetime not null,
`status` bit 
);

create table student(
student_id int auto_increment PRIMARY KEY,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
`status` bit,
class_id int not null,
FOREIGN KEY (class_id) references class(class_id)
);

create table `subject`(
sub_id int auto_increment PRIMARY KEY,
sub_name varchar(30) not null,
credit tinyint not null default 1,
check (credit>=1),
`status` bit default 1
);

create table mark(
mark_id int auto_increment PRIMARY KEY,
sub_id int not null unique key,
student_id int not null unique key,
mark float default 1,
check (mark between 0 and 100),
exam_time tinyint default 1,
FOREIGN KEY (sub_id) references `subject`(sub_id),
FOREIGN KEY (student_id) references student(student_id)
);