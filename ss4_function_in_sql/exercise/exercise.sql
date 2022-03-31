use quan_ly_sinh_vien;

select * from `subject`
where credit = (select max(credit) from `subject`);

select `subject`.sub_id, `subject`.sub_name, mark.mark
from `subject` inner join mark on `subject`.sub_id=mark.sub_id
where mark.mark = (select max(mark) from mark);

select student.student_id, student.student_name, avg(mark.mark)
from student inner join mark on student.student_id = mark.student_id
group by mark.student_id


