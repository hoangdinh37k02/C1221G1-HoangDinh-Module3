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

insert into class value(1,"A1",20/12/2008,1),
(2,"A2",22/12/2008,1),
(3,"A2",22/12/2008,1);

insert into student value(1,"Hung","Ha Noi","0912113113",1,1),
(2,"Hoa","Hai Phong","",1,1),
(3,"Manh","HCM","0123123123",1,1);

insert into `subject` value(1,"CF",5,1),
(2,"C",6,1),
(3,"HDJ",5,1),
(4,"RDBMS",10,1);

insert into mark value(1,1,1,8,1),
(2,3,2,10,2),
(3,2,3,12,1);




