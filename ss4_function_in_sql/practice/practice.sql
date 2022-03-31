use quan_ly_sinh_vien;
select address, count(student_id) as so_luong_sinh_vien
from student
group by address;

select student.student_id, student.student_name, avg(mark.mark) as diem_trung_binh
from student inner join mark on student.student_id=mark.student_id
group by student.student_id, student.student_name;

select student.student_id, student.student_name, avg(mark.mark) as diem_trung_binh
from student inner join mark on student.student_id=mark.student_id
group by student.student_id, student.student_name
having diem_trung_binh>10;

select student.student_id, student.student_name, avg(mark.mark) as diem_lon_nhat
from student inner join mark on student.student_id=mark.student_id
group by student.student_id, student.student_name
having avg(mark.mark)>=all(select avg(mark.mark) from mark group by mark.student_id);