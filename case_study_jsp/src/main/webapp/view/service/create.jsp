<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/21/2022
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create New Customer</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
</head>
<body>
<center>
    <h1>Tạo dịch vụ mới</h1>
    <h2>
        <a href="/"> <button class="btn btn-success">Về trang chủ</button></a>

    </h2>
    <h2>
        <a href="service?action=list"><button class="btn btn-success">Về danh sách</button></a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table class="table table-striped table-bordered">
            <caption>
                <h2>Tạo Dịch vụ </h2>
            </caption>
            <tr>
                <th>Tên dịch vụ:</th>
                <td>
                    <input type="text" name="tenDichVu" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Diện tích:</th>
                <td>
                    <input type="text" name="dienTich" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Chi Phí Thuê:</th>
                <td>
                    <input type="text" name="chiPhiThue" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Số người tối đa:</th>
                <td>
                    <input type="text" name="soNguoiToiDa" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Kiểu Thuê:</th>
                <td>
                    <select name="maKieuThue">
                        <option value="1">Year</option>
                        <option value="2">Month</option>
                        <option value="3">Day</option>
                        <option value="4">Hour</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Loại Dịch Vụ:</th>
                <td>
                    <select name="maLoaiDichVu">
                        <option value="1">Villa</option>
                        <option value="2">House</option>
                        <option value="3">Room</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Tiêu Chuẩn Phòng:</th>
                <td>
                    <input type="text" name="tieuChuanPhong" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Tiện Nghi Khác:</th>
                <td>
                    <input type="text" name="tienNghiKhac" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Diện Tích Hồ Bơi:</th>
                <td>
                    <input type="text" name="dienTichHoBoi" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Số Tầng:</th>
                <td>
                    <input type="text" name="soTang" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input class="btn btn-primary" type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>
