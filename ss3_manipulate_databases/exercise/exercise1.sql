use quan_ly_sinh_vien;
select * from student where student_name like "h%";
update class set start_date = "2008-12-20" where class_id=1;
update class set start_date = "2008-12-22" where class_id=2;
update class set start_date = current_date where class_id=3;
select * from class where month(start_date)=12;
select * from `subject` where credit between 3 and 5;
update student set class_id = 1 where student_id = 2;
select student.student_name, `subject`.sub_name,  mark.mark 
from student join mark on student.student_id=mark.mark_id
join `subject` on  `subject`.sub_id=mark.sub_id
order by mark.mark desc, student.student_name;


