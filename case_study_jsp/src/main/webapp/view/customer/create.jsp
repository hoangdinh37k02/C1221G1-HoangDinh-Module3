<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/19/2022
  Time: 8:45 AM
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
    <h1>Tạo khách hàng mới</h1>
    <h2>
        <a href="/"> <button class="btn btn-success">Về trang chủ</button></a>

    </h2>
    <h2>
        <a href="resort?action=list"><button class="btn btn-success">Về danh sách</button></a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table class="table table-striped table-bordered">
            <caption>
                <h2>Tạo khách hàng</h2>
            </caption>
            <tr>
                <th>Loại khách:</th>
                <td>
                    <select name="maLoaiKhach" id="">
                    <c:forEach items="${customerTypeList}" var="c">
                        <option value="${c.maLoaiKhach}">${c.tenLoaiKhach}</option>
                    </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Họ tên:</th>
                <td>
                    <input type="text" name="hoTen" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Ngày sinh:</th>
                <td>
                    <input type="date" name="ngaySinh" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Giới tính:</th>
                <td>
                    <select name="gioiTinh">
                        <option value="0">Nữ</option>
                        <option value="1">Nam</option>
                    </select>
<%--                    <input type="text" name="gioiTinh" size="45"/>--%>
                </td>
            </tr>
            <tr>
                <th>Số CMND:</th>
                <td>
                    <input type="text" name="soCMND" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Số điện thoại:</th>
                <td>
                    <input type="text" name="soDienThoai" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Địa chỉ:</th>
                <td>
                    <input type="text" name="diaChi" size="45"/>
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
